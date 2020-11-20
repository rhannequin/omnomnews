import React from "react"

import RssFeedItem from "./RssFeedItem"
import Tweet from "./Tweet"

export default function GroupedElement({group}) {
  return (
    <>
      <span className="mb-2 max-w-2xl lg:mx-auto text-center uppercase text-xs font-sans tracking-wide font-bold block text-gray-500">
        <time>{new Date(group.time).toDateString()}</time>
      </span>

      {group.elements.length && (
        <ul className="mb-8 max-w-2xl lg:mx-auto space-y-4">
          {group.elements.map((element, i) => (
            <li key={i}>
              {element.type === "tweet" && (
                <Tweet tweet={element} />
              )}
              {element.type === "rss_feed_item" && (
                <RssFeedItem item={element} />
              )}
            </li>
          ))}
        </ul>
      )}
    </>
  )
}
