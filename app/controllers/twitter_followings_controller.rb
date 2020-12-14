# frozen_string_literal: true

class TwitterFollowingsController < ApplicationController
  before_action :authenticate
  before_action :set_form, only: %i[new create]

  def new; end

  def create
    if @form.submit params.require(:twitter_following)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_form
    @form = Om::FollowTwitterUserForm.new
  end
end
