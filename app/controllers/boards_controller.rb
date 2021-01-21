# frozen_string_literal: true

class BoardsController < AuthenticatedController
  def index; end

  def show; end

  def new
    @board = current_user.boards.new
  end

  def edit; end

  def create
    @board = current_user.boards.new(board_params)

    if @board.save
      add_lists(@board)
      respond_to do |format|
        format.html { redirect_to board_path(@board), notice: 'Board was successfully created.' }
      end
    else
      respond_to do |format|
        format.html { render :edit }
      end
    end
  end

  def update; end

  def destroy; end

  private

  def add_lists(board)
    board.lists.create(name: 'Backlog')
    board.lists.create(name: 'Doing')
    board.lists.create(name: 'QA')
    board.lists.create(name: 'Done')
  end

  helper_method def board
    @board ||= current_user.boards.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
