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
      redirect_to rss_feeds_path
    else
      render :new
    end
  end

  def destroy
    @rss_feed = RssFeed.find(params[:id])
    Om::RssFeed::Destroy.new(@rss_feed).perform
    redirect_to rss_feeds_path
  end
end
