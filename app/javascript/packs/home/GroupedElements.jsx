import React from "react"

import GroupedElement from "./GroupedElement"

export default function GroupedElements({groups}) {
  return (
    <>
      {groups.map((group, i) => (
        <GroupedElement key={i} group={group} />
      ))}
    </>
  )
}
