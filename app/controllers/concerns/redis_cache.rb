module RedisCache
  extend ActiveSupport::Concern

  def cache_seat(seat_number, session_id, seat_status)
    RedisStore.set_seat(seat_number, session_id, seat_status)
  end

  def destroy_cache_seats(session_id)
    RedisStore.read_all.map do |seat|
      next unless seat[:user_token] == session_id &&
                  seat[:status] != Seat::RESERVED_STATUS

      cache_seat(seat[:number], nil, Seat::FREE_STATUS)
      { number: seat[:number], status: Seat::FREE_STATUS }
    end.compact
  end
end
