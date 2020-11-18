import React from "react"

import RssFeed from "./RssFeed"

export default function RssFeeds({rssFeeds, includedRelationships}) {
  function getItems(rssFeed) {
    const itemIds = rssFeed.relationships.items.data.map(item => item.id)
    return includedRelationships.filter(
      relationship => itemIds.includes(relationship.id)
    )
  }

  return (
    <>
      {rssFeeds && rssFeeds.map((rssFeed, i) => (
        <RssFeed
          key={i}
          title={rssFeed.attributes.title}
          items={getItems(rssFeed)}
        />
      ))}
    </>
  )
}
