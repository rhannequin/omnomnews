import React from "react"

import GroupedRssFeedItem from "./GroupedRssFeedItem"

export default function GroupedRssFeedItems({groups}) {
  return (
    <>
      {groups.map((group, i) => (
        <GroupedRssFeedItem key={i} group={group} />
      ))}
    </>
  )
}
