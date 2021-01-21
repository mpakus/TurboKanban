# frozen_string_literal: true

class Boards::TasksController < AuthenticatedController
  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = list.tasks.new
  end

  def edit; end

  def create
    @task = list.tasks.new(task_params)

    if @task.save
      respond_to do |format|
        format.turbo_stream { stream_new_form(@task.list) }
        format.html { redirect_to board_path(board), notice: 'Task was successfully created.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { stream_edit_form(@task.list) }
        format.html { redirect_to board_path(board), notice: 'Task was successfully created.' }
      end
    end
  end

  def update
    list = board.lists.where(id: params[:from_list_id]).take
    task = list.tasks.find(params[:id])

    if task.update(task_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to board_path(board), notice: 'Task was successfully updated.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { stream_edit_form(@task.list) }
        format.html { redirect_to board_path(board), notice: 'Task was successfully created.' }
      end
    end
  end

  def destroy
    task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  def stream_edit_form(list)
    render turbo_stream:
             turbo_stream.replace("new_task_#{list.id}", partial: 'boards/tasks/form', locals: { list: list })
  end

  def stream_new_form(list)
    render turbo_stream:
             turbo_stream.replace("new_task_#{list.id}", partial: 'boards/tasks/new_task', locals: { list: list })
  end

  helper_method def task
    @task ||= Task.find(params[:id])
  end

  helper_method def board
    @board ||= Board.find(params[:board_id]) # @TODO: current_user.boards ... assigned to the user
  end

  helper_method def list
    return @list if defined? @list

    @list = board.lists.where(id: params[:list_id]).take if params[:list_id]
    @list = board.lists.where(id: task_params[:list_id]).take if params.dig(:task, :list_id)

    @list
  end

  def task_params
    params.require(:task).permit(:name, :description, :position, :list_id)
  end
end
