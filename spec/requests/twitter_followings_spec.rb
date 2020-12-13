# frozen_string_literal: true

require "rails_helper"

describe TwitterFollowingsController, type: :request do
  describe "POST #create" do
    let(:subject) { post twitter_followings_path, params: params }
    let(:params) { { twitter_following: { username: "dhh" } } }

    context "when user is authenticated" do
      let(:account) { FactoryBot.build(:account) }
      let(:submit_status) { true }

      before do
        login_as(account)

        allow_any_instance_of(Om::FollowTwitterUser).to(
          receive(:submit).and_return(submit_status)
        )
      end

      it "redirects to home page" do
        subject
        expect(response).to redirect_to(root_path)
      end

      context "when form failed" do
        let(:submit_status) { false }

        it "returns an error status code" do
          subject
          expect(response).not_to redirect_to(root_path)
        end
      end
    end

    context "when user is not authenticated" do
      it "redirects to login page" do
        subject
        expect(response).to redirect_to("/login")
      end
    end
  end
end
