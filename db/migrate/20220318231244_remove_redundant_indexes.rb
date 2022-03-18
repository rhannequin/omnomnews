# frozen_string_literal: true

class RemoveRedundantIndexes < ActiveRecord::Migration[7.0]
  def change
    remove_index :taggings, name: "index_taggings_on_tag_id"
    remove_index :taggings, name: "index_taggings_on_taggable_id"
    remove_index :taggings, name: "index_taggings_on_taggable_type"
    remove_index :taggings, name: "index_taggings_on_tagger_id"
  end
end
