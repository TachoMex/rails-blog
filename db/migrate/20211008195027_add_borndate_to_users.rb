# frozen_string_literal: true

class AddBorndateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :borndate, :datetime, null: false)
  end
end
