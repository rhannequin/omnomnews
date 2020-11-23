# frozen_string_literal: true

json.errors do
  json.array! @errors do |attribute, messages|
    json.attribute attribute
    json.messages messages
  end
end
