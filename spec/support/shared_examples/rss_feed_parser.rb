# frozen_string_literal: true

shared_context "when RSS feed has to be parsed" do
  let(:feed_object) { {channel: {title: "Feed Title"}} }
  let(:fake_rss_feed) do
    JSON.parse(feed_object.to_json, object_class: OpenStruct)
  end

  before do
    parse_dbl = instance_double(Om::RssFeed::Parse, parse: fake_rss_feed)
    allow(Om::RssFeed::Parse).to receive(:new).and_return(parse_dbl)
  end
end
