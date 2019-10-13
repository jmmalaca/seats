# frozen_string_literal: true

json.extract! seat, :number, :status
json.url seat_url(seat, format: :json)
