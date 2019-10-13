module SessionActions
  extend ActiveSupport::Concern

  def cache_and_broadcast(_seat_number, _session_id, _seat_status)
    cache_seat(@seat.number, session[:session_id], @seat.status)
    broadcast_seat_data(@seat.number, @seat.status)
  end

  def destroy_and_broadcast(session_id)
    destroy_cache_seats(session_id).each do |seat|
      broadcast_seat_data(seat[:number], seat[:status])
    end
  end
end
