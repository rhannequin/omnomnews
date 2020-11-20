# frozen_string_literal: true

require "rails_helper"

describe Om::Twitter::Tweet::Proxy, :twitter_fake_api do
  subject { described_class.new(tweet) }

  let(:tweet) { Om::Twitter::Client.new.provider.status }

  describe "#attributes" do
    let(:attributes) { subject.attributes }

    it "works" do
      expect { attributes }.not_to raise_error
    end
  end
end
