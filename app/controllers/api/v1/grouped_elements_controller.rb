# frozen_string_literal: true

class Api::V1::GroupedElementsController < Api::V1::Base
  def index
    @grouped_elements = Om::Queries::GroupedElements.new.fetch
  end
end
