# frozen_string_literal: true

require "rails_helper"

describe HomeController, type: :request do
  describe "GET #index" do
    it "is successfull" do
      get root_path
      expect(response).to be_successful
    end
  end
end
