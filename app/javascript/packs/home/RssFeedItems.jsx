import React from "react"

import RssFeedItem from "./RssFeedItem"

export default function RssFeedItems({items}) {
  return (
    <>
      {items.length && (
        <ul className="mt-4 max-w-2xl lg:mx-auto divide-y">
          {items.map((item, i) => (
            <RssFeedItem key={i} item={item} />
          ))}
        </ul>
      )}
    </>
  )
}
