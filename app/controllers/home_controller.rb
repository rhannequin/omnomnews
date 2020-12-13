# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @grouped_elements = Om::Queries::GroupedElements.new.fetch
  end
end
