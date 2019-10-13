# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seat, type: :model do
  context 'with a seat' do
    it 'is invalid without number' do
      expect(build(:seat, number: nil)).not_to be_valid
    end

    it 'is invalid without status' do
      expect(build(:seat, status: nil)).not_to be_valid
    end

    it 'is valid' do
      expect(build(:seat)).to be_valid
    end
  end
end
