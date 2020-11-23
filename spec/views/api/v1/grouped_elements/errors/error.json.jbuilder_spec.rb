# frozen_string_literal: true

require "rails_helper"

describe "api/v1/errors/error", type: :view do
  include_context "serializer"

  let(:errors) { { username: ["can't be blank"] } }

  before { assign(:errors, errors) }

  let(:expected_json) do
    {
      errors: [
        {
          attribute: :username,
          messages: ["can't be blank"],
        },
      ],
    }
  end

  it_behaves_like "a JSON view"
end
