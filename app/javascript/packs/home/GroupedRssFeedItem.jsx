import React from "react"

import RssFeedItems from "./RssFeedItems"

export default function GroupedRssFeedItem({group}) {
  return (
    <>
      <span className="mb-2 max-w-2xl lg:mx-auto uppercase text-xs font-sans tracking-wide font-bold block text-gray-500">
        <time>{new Date(group.time).toDateString()}</time>
      </span>

      {<RssFeedItems items={group.rss_feed_items} />}
    </>
  )
}
