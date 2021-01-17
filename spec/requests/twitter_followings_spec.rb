# frozen_string_literal: true

require "rails_helper"

describe TwitterFollowingsController, type: :request do
  describe "POST #create" do
    subject(:execute_request) { post twitter_followings_path, params: params }

    let(:account) { FactoryBot.create(:account) }
    let(:params) { { twitter_following: { username: "dhh" } } }

    context "when user is authenticated" do
      let(:submit_status) { true }

      before do
        login_as(account)

        # rubocop:disable RSpec/AnyInstance
        allow_any_instance_of(Om::FollowTwitterUserForm).to(
          receive(:submit).and_return(submit_status),
        )
        # rubocop:enable RSpec/AnyInstance
      end

      it "redirects to home page" do
        execute_request
        expect(response).to redirect_to(twitter_followings_path)
      end

      context "when form failed" do
        let(:submit_status) { false }

        it "returns an error status code" do
          execute_request
          expect(response).not_to redirect_to(root_path)
        end
      end
    end

    context "when user is not authenticated" do
      it "redirects to login page" do
        execute_request
        expect(response).to redirect_to("/login")
      end
    end
  end
end
