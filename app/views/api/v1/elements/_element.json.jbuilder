type = element.class.name.underscore

json.partial! "api/v1/#{type.pluralize}/#{type}", type.to_sym => element
