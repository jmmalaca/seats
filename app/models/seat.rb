# frozen_string_literal: true

class Seat < ApplicationRecord
  FREE_STATUS = 'free'
  SELECTED_STATUS = 'selected'
  RESERVED_STATUS = 'reserved'
  SEATS_DEFAULT_STATUS = [FREE_STATUS, SELECTED_STATUS, RESERVED_STATUS].freeze

  validates :number, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: SEATS_DEFAULT_STATUS

  scope :ordered, -> { order(:number) }
  scope :batched, ->(offset, limit) { offset(offset).limit(limit) }
end
