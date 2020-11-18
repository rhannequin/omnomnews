import React from "react"

import RssFeedItems from "./RssFeedItems"

export default function RssFeed({title, items}) {
  return (
    <>
      <p className="mt-4 max-w-2xl text-xl leading-7 text-gray-500 lg:mx-auto">
        {title} ({items.length} items)
      </p>
      <RssFeedItems items={items} />
    </>
  )
}
