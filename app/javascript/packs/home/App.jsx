import React, { useState, useEffect } from "react"

import { getRssFeedItems } from "../core/api"

import GroupedRssFeedItems from "./GroupedRssFeedItems"

export default function App() {
  const [groupedRssFeedItems, setGroupedRssFeedItems] = useState([])

  useEffect(() => {
    getRssFeedItems()
      .then(response => {
        setGroupedRssFeedItems(response.data)
      }).catch(err => { console.log(err) })
  }, [])

  return (
    <GroupedRssFeedItems groups={groupedRssFeedItems} />
  )
}
