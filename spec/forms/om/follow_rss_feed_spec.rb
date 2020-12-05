# frozen_string_literal: true

require "rails_helper"

describe Om::FollowRssFeed do
  subject { described_class.new }

  let(:uri) { FactoryBot.build(:rss_feed).uri }
  let(:params) { { uri: uri } }

  let(:service_dbl) { double(Om::RssFeed::Create) }
  let(:service_succeeded) { true }

  before do
    allow(Om::RssFeed::Create).to(
      receive(:new).with(uri).and_return(service_dbl)
    )
    allow(service_dbl).to receive(:perform).and_return(service_succeeded)
  end

  describe "#perform" do
    it "returns true" do
      expect(subject.submit(params)).to eq(true)
    end

    context "when service is errors" do
      let(:service_succeeded) { false }
      let(:error_message) { "Something went wrong" }

      before do
        allow(service_dbl).to receive(:errors).and_return([error_message])
      end

      it "returns false" do
        expect(subject.submit(params)).to eq(false)
      end

      it "contains errors" do
        subject.submit(params)
        expect(subject.errors.full_messages).to include(error_message)
      end
    end
  end
end
