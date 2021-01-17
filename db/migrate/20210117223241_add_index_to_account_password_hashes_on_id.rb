# frozen_string_literal: true

class AddIndexToAccountPasswordHashesOnId < ActiveRecord::Migration[6.1]
  def change
    add_index :account_password_hashes, :id
  end
end
