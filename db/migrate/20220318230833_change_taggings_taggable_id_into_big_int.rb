# frozen_string_literal: true

class ChangeTaggingsTaggableIdIntoBigInt < ActiveRecord::Migration[6.1]
  def change
    change_column :taggings, :taggable_id, :bigint
  end
end
