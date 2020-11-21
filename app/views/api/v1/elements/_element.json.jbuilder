# frozen_string_literal: true

type = element.class.name.underscore

json.partial! "api/v1/elements/#{type}", type.to_sym => element
