# frozen_string_literal: true

class RssFeedsController < ApplicationController
  before_action :authenticate

  def index
    @rss_feeds = RssFeed.all
  end

  def new
    @rss_feed = RssFeed.new
    @form = Om::FollowRssFeedForm.new
  end

  def create
    @rss_feed = RssFeed.new
    @form = Om::FollowRssFeedForm.new
    if @form.submit params.require(:rss_feed)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @rss_feed = RssFeed.find(params[:id])
    @form = Om::UpdateRssFeedForm.new(
      rss_feed_id: @rss_feed.id,
      uri: @rss_feed.uri,
    )
  end

  def update
    @rss_feed = RssFeed.find(params[:id])
    @form = Om::UpdateRssFeedForm.new(rss_feed_id: @rss_feed.id)
    if @form.submit params.require(:rss_feed)
      redirect_to root_path
    else
      render :edit
    end
  end
end
