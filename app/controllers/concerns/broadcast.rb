module Broadcast
  extend ActiveSupport::Concern

  def broadcast_seat_data(number, status)
    ActionCable.server.broadcast(
      'seats',
      number: number,
      status: broadcast_seat_status(status)
    )
  end

  def broadcast_seat_status(seat_status)
    seat_status == Seat::SELECTED_STATUS ? 'selected_by_other' : seat_status
  end
end
