# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

default_start_status = Seat::SEATS_DEFAULT_STATUS.first

(1..(20 * 25)).each do |counter|
  seat = Seat.where(
    number: counter,
    status: default_start_status
  ).first_or_create(
    number: counter,
    status: default_start_status
  )

  seat.update_attributes!(
    number: counter,
    status: default_start_status
  )

  Rails.cache.redis.set(counter, { user_token: nil, status: seat.status }.to_json)
end
