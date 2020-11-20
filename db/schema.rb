# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_20_152024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rss_feed_items", force: :cascade do |t|
    t.bigint "rss_feed_id"
    t.string "identifier", null: false
    t.string "title", null: false
    t.string "link"
    t.text "description"
    t.datetime "published_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["identifier"], name: "index_rss_feed_items_on_identifier"
    t.index ["rss_feed_id"], name: "index_rss_feed_items_on_rss_feed_id"
  end

  create_table "rss_feeds", force: :cascade do |t|
    t.string "uri", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title", null: false
    t.string "link"
    t.text "description"
  end

  create_table "tweet_uris", force: :cascade do |t|
    t.bigint "tweet_id"
    t.string "url"
    t.string "expanded_url"
    t.string "display_url"
    t.integer "indice_start"
    t.integer "indice_end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tweet_id"], name: "index_tweet_uris_on_tweet_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "twitter_following_id"
    t.bigint "identifier", null: false
    t.string "content", null: false
    t.datetime "tweeted_at", null: false
    t.boolean "truncated", default: false, null: false
    t.boolean "retweet", default: false, null: false
    t.bigint "retweet_identifier"
    t.boolean "quote", default: false, null: false
    t.bigint "quote_identifier"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "retweet_author"
    t.index ["twitter_following_id"], name: "index_tweets_on_twitter_following_id"
  end

  create_table "twitter_followings", force: :cascade do |t|
    t.string "username", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
