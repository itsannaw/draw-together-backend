class BoardChannel < ApplicationCable::Channel
  def subscribed
    board_id = params['id']
    channel_name = "board_channel_#{board_id}"

    stream_from channel_name

    stream_for channel_name
    @board = Board.find(board_id)
    ActionCable.server.broadcast channel_name, "#{board_id} joined!"
    ActionCable.server.broadcast channel_name, @board.snapshot
  end

  def send_json(obj)
    data = obj["data"];
    board_id = obj["id"];
    channel_name = "board_channel_#{board_id}"
    @board = Board.find(board_id)
    @board.snapshot = data
    @board.save
    ActionCable.server.broadcast channel_name, data
  end

  def unsubscribed
    channel_name = "board_channel_#{params["id"]}"
    ActionCable.server.broadcast channel_name, "disconnect"
    Board.find
    # Any cleanup needed when channel is unsubscribed
  end
end
