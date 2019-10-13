# frozen_string_literal: true

class SeatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'seats'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
