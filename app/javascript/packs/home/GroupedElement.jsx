import React from "react"

import Elements from "./Elements"

export default function GroupedElement({group}) {
  return (
    <>
      <span className="mb-2 max-w-2xl lg:mx-auto uppercase text-xs font-sans tracking-wide font-bold block text-gray-500">
        <time>{new Date(group.time).toDateString()}</time>
      </span>

      {<Elements elements={group.elements} />}
    </>
  )
}
