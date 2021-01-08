# frozen_string_literal: true

class RssFeedsController < ApplicationController
  before_action :authenticate
  before_action :set_form, only: %i[new create]

  def index
    @rss_feeds = RssFeed.all
  end

  def new; end

  def create
    if @form.submit params.require(:rss_feed)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_form
    @form = Om::FollowRssFeedForm.new
  end
end
