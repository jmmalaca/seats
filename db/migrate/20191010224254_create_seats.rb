# frozen_string_literal: true

class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.integer :number, null: false
      t.string :status, null: false, default: 'free'

      t.timestamps
    end
  end
end
