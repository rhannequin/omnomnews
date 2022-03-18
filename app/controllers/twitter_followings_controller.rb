# frozen_string_literal: true

class TwitterFollowingsController < ApplicationController
  before_action :authenticate
  before_action :twitter_followings, :set_form, only: %i[new create]

  def index
    @twitter_followings = current_account.twitter_followings
  end

  def new
  end

  def create
    if @form.submit params.require(:twitter_following)
      redirect_to twitter_followings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @twitter_following = current_account.twitter_followings.find(params[:id])
    Om::Twitter::UnfollowUser.new(@twitter_following).perform
    redirect_to twitter_followings_path, notice: t("twitter_followings.destroy.flash.notice"), status: :see_other
  end

  private

  def twitter_followings
    @twitter_following = current_account.twitter_followings.new
  end

  def set_form
    @form = Om::FollowTwitterUserForm.new(account_id: current_account.id)
  end
end
