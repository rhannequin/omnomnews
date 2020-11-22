# frozen_string_literal: true

require "rails_helper"

describe HomeController do
  describe "GET #index" do
    let(:subject) { get :index }

    it "is successfull" do
      subject
      expect(response).to be_successful
    end
  end
end
