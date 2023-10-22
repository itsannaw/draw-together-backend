class BoardChannel < ApplicationCable::Channel
  def subscribed
    board_id = params['id']
    channel_name = "board_channel_#{board_id}"

    stream_from channel_name

    stream_for channel_name

    ActionCable.server.broadcast channel_name, "#{board_id} joined!"
  end

  def send_json(obj)
    puts obj
    puts '--------------------------------------11111-------------------------------------------------'
    data = obj["data"];
    board_id = obj["id"];
    channel_name = "board_channel_#{board_id}"
    ActionCable.server.broadcast channel_name, data
  end

  def unsubscribed
    ActionCable.server.broadcast 'board_channel', "disconnect"
    puts '--------------------------------------11111-------------------------------------------------'
    # Any cleanup needed when channel is unsubscribed
  end
end
