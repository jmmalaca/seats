# frozen_string_literal: true

FactoryBot.define do
  factory :seat do
    sequence(:number)
    status { 'free' }
  end
end
