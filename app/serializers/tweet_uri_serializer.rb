# frozen_string_literal: true

class TweetUriSerializer
  include FastJsonapi::ObjectSerializer

  attributes :url, :expanded_url, :display_url, :indice_start, :indice_end
end
