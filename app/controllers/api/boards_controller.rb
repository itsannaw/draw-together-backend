class Api::BoardsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :delete]

  def index
    @boards = Board.all
    render json: @boards
  end

  def create
    @board = Board.create(name: params[:name], snapshot: params[:snapshot])
    if @board.persisted?
      render json: { message: 'The board has been successfully created!' }
    else
      render json: { error: 'A board by that name already exists!' }, status: :unprocessable_entity
    end
  end

  def delete
    board = Board.find(params[:id])
    board.destroy
    render json: { message: 'The board has been successfully deleted!' }
  end

end
