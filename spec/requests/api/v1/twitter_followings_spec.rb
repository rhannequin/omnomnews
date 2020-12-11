# frozen_string_literal: true

require "rails_helper"

describe Api::V1::TwitterFollowingsController, type: :request do
  describe "POST #create" do
    let(:subject) do
      post api_v1_twitter_followings_path, params: {
        format: :json,
        twitter_following: { username: "dhh" },
      }
    end

    let(:submit_status) { true }

    before do
      allow_any_instance_of(Om::FollowTwitterUser).to(
        receive(:submit).and_return(submit_status)
      )
    end

    it "is successfull" do
      subject
      expect(response).to be_successful
    end

    context "when form failed" do
      let(:submit_status) { false }

      it "returns an error status code" do
        subject
        expect(response.code.to_i).to eq(400)
      end
    end
  end
end
