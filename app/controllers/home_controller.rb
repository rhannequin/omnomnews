# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    return unless rodauth.logged_in?

    @grouped_elements = Om::Queries::GroupedElements
      .new(account: current_account)
      .fetch
  end
end
