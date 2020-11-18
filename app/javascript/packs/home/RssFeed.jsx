import React, { useState } from "react"

import RssFeedItems from "./RssFeedItems"

export default function RssFeed({title, items}) {
  const [opened, setOpened] = useState(false)

  function toggleItems() {
    setOpened(!opened)
  }

  return (
    <>
      <p
        className="mt-4 max-w-2xl text-xl leading-7 text-gray-500 lg:mx-auto cursor-pointer"
        onClick={toggleItems}
      >
        {opened ? "⬇️" : "➡️"} {title} ({items.length} items)
      </p>
      {opened && (
        <RssFeedItems items={items} />
      )}
    </>
  )
}
