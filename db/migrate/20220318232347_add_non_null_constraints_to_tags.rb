# frozen_string_literal: true

class AddNonNullConstraintsToTags < ActiveRecord::Migration[7.0]
  def change
    change_column_null :tags, :name, false
  end
end
