class Api::BoardsController < ApplicationController
  def create
    Board.create(name: params[:name], snapshot: params[:snapshot])
    render json: { message: 'Доска успешно создана' }
  end

  def delete
    board = Board.find(params[:id])
    board.destroy
    render json: { message: 'Доска успешно удалена' }
  end
end
