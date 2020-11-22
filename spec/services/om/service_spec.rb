# frozen_string_literal: true

require "rails_helper"

describe Om::Service do
  subject(:service) do
    Class.new(described_class) do
      perform {} # rubocop:disable Lint/EmptyBlock
    end.new
  end

  let(:service_with_error) do
    Class.new(described_class) do
      perform { add_error :error }
    end.new
  end

  describe "#perform" do
    it "returns true" do
      expect(service.perform).to be true
    end

    context "when service has errors" do
      subject(:service) { service_with_error }

      it "returns false" do
        expect(service.perform).to be false
      end
    end
  end

  describe "#perform!" do
    it "returns true" do
      expect(service.perform!).to be true
    end

    context "when service has errors" do
      subject(:service) { service_with_error }

      it "raises error" do
        expect { service.perform! }.to(
          raise_error(Om::Service::ServiceFailedError)
        )
      end
    end
  end
end
