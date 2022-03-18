# frozen_string_literal: true

class AddNonNullConstraintsToTaggings < ActiveRecord::Migration[7.0]
  def change
    change_column_null :taggings, :tag_id, false
    change_column_null :taggings, :taggable_id, false
    change_column_null :taggings, :context, false
  end
end
