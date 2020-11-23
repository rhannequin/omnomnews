# frozen_string_literal: true

require "rails_helper"

describe Om::FollowTwitterUser do
  subject { described_class.new }
  let(:params) { { username: :dhh } }
  let(:service_return) { true }

  before do
    allow_any_instance_of(Om::Twitter::FollowUser).to(
      receive(:perform).and_return(service_return)
    )
  end

  describe "#perform" do
    it "returns true" do
      expect(subject.submit(params)).to eq(true)
    end

    context "when service returns false" do
      let(:service_return) { false }

      it "returns false" do
        expect(subject.submit(params)).to eq(false)
      end
    end
  end
end
