# frozen_string_literal: true

require "rails_helper"

describe Om::Validations do
  subject(:instance) { Class.new { include Om::Validations }.new }

  let(:instance_with_error) do
    Class.new do
      include Om::Validations
      validate { add_error :error }
    end.new
  end

  describe "#valid?" do
    it "returns true" do
      expect(instance.valid?).to be true
    end

    context "when instance has errors" do
      subject(:instance) { instance_with_error }

      it "returns false" do
        expect(instance.valid?).to be false
      end
    end
  end

  describe "#invalid?" do
    it "returns false" do
      expect(instance.invalid?).to be false
    end

    context "when instance has errors" do
      subject(:instance) { instance_with_error }

      it "returns true" do
        expect(instance.invalid?).to be true
      end
    end
  end
end
