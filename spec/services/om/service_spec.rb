# frozen_string_literal: true

require "rails_helper"

describe Om::Service do
  subject(:service) do
    Class
      .new(described_class) { perform {} }
      .new
  end

  describe "#perform" do
    it "returns true" do
      expect(service.perform).to be true
    end

    context "when service has errors" do
      it "returns false" do
        service = Class
          .new(described_class) { perform { add_error :error } }
          .new
        expect(service.perform).to be false
      end
    end
  end

  describe "#perform!" do
    it "returns true" do
      expect(service.perform!).to be true
    end

    context "when service has errors" do
      it "raises error" do
        service = Class
          .new(described_class) { perform { add_error :error } }
          .new
        expect { service.perform! }.to(
          raise_error(Om::Service::ServiceFailedError)
        )
      end
    end
  end
end
