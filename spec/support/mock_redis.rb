# frozen_string_literal: true

RSpec.configure do |config|
  config.before do
    Rails.cache.stub(:redis).and_return(MockRedis.new)
  end
end
