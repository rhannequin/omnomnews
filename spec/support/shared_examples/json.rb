# frozen_string_literal: true

shared_examples "serializer" do
  shared_examples_for "a JSON view" do
    it "renders correctly" do
      render

      expect(JSON.pretty_generate(JSON.parse(rendered))).to(
        eq(JSON.pretty_generate(expected_json))
      )
    end
  end
end
