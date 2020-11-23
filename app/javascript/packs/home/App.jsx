import React, { useState, useEffect } from "react"

import { getGroupedElements } from "../core/api"

import GroupedElements from "./GroupedElements"
import Actions from "./Actions"

export default function App() {
  const [groupedElements, setGroupedElements] = useState([])

  const refreshElementList = () => {
    getGroupedElements()
      .then(response => { setGroupedElements(response.data) })
      .catch(err => { console.log(err) })
  }

  useEffect(refreshElementList, [])

  return (
    <>
      <Actions />
      <GroupedElements groups={groupedElements} />
    </>
  )
}
