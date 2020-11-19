import React from "react"

import RssFeedItem from "./RssFeedItem"

export default function RssFeedItems({items}) {
  return (
    <>
      {items.length && (
        <ul className="mb-8 max-w-2xl lg:mx-auto space-y-4">
          {items.map((item, i) => (
            <RssFeedItem key={i} item={item} />
          ))}
        </ul>
      )}
    </>
  )
}
