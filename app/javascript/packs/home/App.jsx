import React, { useState, useEffect } from "react"

import { getGroupedElements } from "../core/api"

import GroupedElements from "./GroupedElements"

export default function App() {
  const [groupedElements, setGroupedElements] = useState([])

  useEffect(() => {
    getGroupedElements()
      .then(response => {
        setGroupedElements(response.data)
      }).catch(err => { console.log(err) })
  }, [])

  return (
    <GroupedElements groups={groupedElements} />
  )
}
