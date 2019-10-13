module RedisStore
  module_function

  def read_all
    Rails.cache.redis.keys.sort_by(&:to_i).map do |key|
      key_values = JSON.parse(read_seat(key))
      {
        number: key,
        user_token: key_values['user_token'],
        status: key_values['status']
      }
    end
  end

  def set_seat(number, user_token, status)
    Rails.cache.redis.set(
      number,
      { user_token: user_token, status: status }.to_json
    )
  end

  def read_seat(number)
    Rails.cache.redis.get(number)
  end
end
