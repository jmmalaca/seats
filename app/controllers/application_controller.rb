# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Broadcast
  include RedisCache
  include SessionActions
end
