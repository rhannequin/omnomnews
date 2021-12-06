# frozen_string_literal: true

class TwitterFollowingsController < ApplicationController
  before_action :authenticate

  def index
    @twitter_followings = TwitterFollowing.all
  end

  def new
    @twitter_following = TwitterFollowing.new
    @form = Om::FollowTwitterUserForm.new
  end

  def create
    @twitter_following = TwitterFollowing.new
    @form = Om::FollowTwitterUserForm.new
    if @form.submit params.require(:twitter_following)
      redirect_to twitter_followings_path
    else
      render :new
    end
  end

  def destroy
    @twitter_following = TwitterFollowing.find(params[:id])
    Om::Twitter::UnfollowUser.new(@twitter_following).perform
    respond_to do |format|
      format.html { redirect_to twitter_followings_path }
      format.turbo_stream
    end
  end
end
