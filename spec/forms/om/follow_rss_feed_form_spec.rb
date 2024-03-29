# frozen_string_literal: true

require "rails_helper"

describe Om::FollowRssFeedForm do
  subject(:form) { described_class.new(account_id: account.id) }

  let(:account) { FactoryBot.create(:account) }
  let(:uri) { FactoryBot.build(:rss_feed).uri }
  let(:params) { {uri: uri} }

  let(:service_dbl) do
    instance_double(Om::RssFeed::Create, perform: service_succeeded)
  end
  let(:service_succeeded) { true }

  before do
    allow(Om::RssFeed::Create).to(
      receive(:new).with(account.id, uri).and_return(service_dbl)
    )
  end

  describe "#perform" do
    it "returns true" do
      expect(form.submit(params)).to eq(true)
    end

    context "when the URI is invalid" do
      let(:uri) { "invalid url" }

      it "returns false" do
        expect(form.submit(params)).to eq(false)
      end

      it "adds an error on the uri attribute" do
        form.submit(params)
        expect(form.errors.full_messages.first).to(
          include(I18n.t("activerecord.errors.models.rss_feed.attributes.uri.invalid"))
        )
      end
    end

    context "when service is errors" do
      let(:service_succeeded) { false }
      let(:error_message) { "Something went wrong" }

      before do
        allow(service_dbl).to receive(:errors).and_return([error_message])
      end

      it "returns false" do
        expect(form.submit(params)).to eq(false)
      end

      it "contains errors" do
        form.submit(params)
        expect(form.errors.full_messages).to include(error_message)
      end
    end
  end
end
