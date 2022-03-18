# frozen_string_literal: true

require "rails_helper"

describe Om::Validations do
  subject(:instance) { Class.new { include Om::Validations }.new }

  describe "#valid?" do
    it "returns true" do
      expect(instance.valid?).to be true
    end

    context "when instance has errors" do
      it "returns false" do
        instance = Class.new do
          include Om::Validations
          validate { add_error :error }
        end.new

        expect(instance.valid?).to be false
      end
    end
  end

  describe "#invalid?" do
    it "returns false" do
      expect(instance.invalid?).to be false
    end

    context "when instance has errors" do
      it "returns true" do
        instance = Class.new do
          include Om::Validations
          validate { add_error :error }
        end.new

        expect(instance.invalid?).to be true
      end
    end
  end
end
