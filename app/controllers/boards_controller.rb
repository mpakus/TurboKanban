# frozen_string_literal: true

class BoardsController < ApplicationController
  def index; end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private

  helper_method def board
    @board ||= Board.find(params[:id])
  end
end
