# frozen_string_literal: true

require "rails_helper"

describe HomeController, type: :request do
  describe "GET #index" do
    let(:subject) { get root_path }

    it "is successfull" do
      subject
      expect(response).to be_successful
    end
  end
end
