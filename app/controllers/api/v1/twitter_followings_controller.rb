# frozen_string_literal: true

class Api::V1::TwitterFollowingsController < Api::V1::Base
  def create
    form = Om::FollowTwitterUser.new
    if form.submit(params.require(:twitter_following))
      head :no_content
    else
      @errors = form.errors.messages
      render "api/v1/errors/error", status: :bad_request
    end
  end
end
