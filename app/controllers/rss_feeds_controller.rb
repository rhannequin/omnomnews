# frozen_string_literal: true

class RssFeedsController < ApplicationController
  before_action :authenticate
  before_action :set_rss_feed, :set_form, only: %i[new create]

  def index
    @rss_feeds = current_account.rss_feeds
  end

  def new
  end

  def create
    if @form.submit params.require(:rss_feed)
      redirect_to rss_feeds_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rss_feed = current_account.rss_feeds.find(params[:id])
    Om::RssFeed::Destroy.new(@rss_feed).perform
    redirect_to rss_feeds_path, notice: t("rss_feeds.destroy.flash.notice"), status: :see_other
  end

  private

  def set_rss_feed
    @rss_feed = current_account.rss_feeds.new
  end

  def set_form
    @form = Om::FollowRssFeedForm.new(account_id: current_account.id)
  end
end
