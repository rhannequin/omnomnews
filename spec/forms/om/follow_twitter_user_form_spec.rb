# frozen_string_literal: true

require "rails_helper"

describe Om::FollowTwitterUserForm do
  subject(:form) { described_class.new }

  let(:params) { { username: :dhh } }
  let(:service_return) { true }

  before do
    service_dbl =
      instance_double(Om::Twitter::FollowUser, perform: service_return)
    allow(Om::Twitter::FollowUser).to(receive(:new).and_return(service_dbl))
  end

  describe "#perform" do
    it "returns true" do
      expect(form.submit(params)).to eq(true)
    end

    context "when service returns false" do
      let(:service_return) { false }

      it "returns false" do
        expect(form.submit(params)).to eq(false)
      end
    end
  end
end
