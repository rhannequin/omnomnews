# frozen_string_literal: true

require "rails_helper"

describe Om::UpdateRssFeedForm do
  subject(:form) { described_class.new(rss_feed_id: rss_feed.id) }

  let(:rss_feed) { FactoryBot.create(:rss_feed) }
  let(:uri) { "https://rubyonrails.org" }
  let(:params) { { uri: uri } }

  let(:service_dbl) do
    instance_double(Om::RssFeed::Update, perform: service_succeeded)
  end
  let(:service_succeeded) { true }

  before do
    allow(Om::RssFeed::Update).to(
      receive(:new)
        .with(rss_feed_id: rss_feed.id, uri: uri)
        .and_return(service_dbl)
    )
  end

  describe "#perform" do
    it "returns true" do
      expect(form.submit(params)).to eq(true)
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
