import React from "react"

import RssFeedItem from "./RssFeedItem"
import Tweet from "./Tweet"

export default function Element({element}) {
  return (
    <li>
      {element.type === "tweet" && (
        <Tweet tweet={element} />
      )}
      {element.type === "rss_feed_item" && (
        <RssFeedItem item={element} />
      )}
    </li>
  )
}
