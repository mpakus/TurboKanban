class Boards::TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = list.tasks.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
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
      # render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to board_path(board), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  def stream_edit_form(list)
    render turbo_stream:
             turbo_stream.replace("new_task_#{list.id}", partial: "boards/tasks/form", locals: { list: list })
  end

  def stream_new_form(list)
    render turbo_stream:
             turbo_stream.replace("new_task_#{list.id}", partial: "boards/tasks/new_task", locals: { list: list })
  end

  helper_method def task
    @task ||= Task.find(params[:id])
  end

  helper_method def board
    @board ||= Board.find(params[:board_id])
  end

  helper_method def list
    return @list if defined? @list

    @list = board.lists.where(id: params[:list_id]).take if params[:list_id]
    @list = board.lists.where(id: task_params[:list_id]).take if params.dig(:task, :list_id)

    @list
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :description, :list_id)
  end
end
