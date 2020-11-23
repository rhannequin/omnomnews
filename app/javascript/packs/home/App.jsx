import React, { useState, useEffect } from "react"

import { getGroupedElements } from "../core/api"

import AddTwitterFollowingModal from "./AddTwitterFollowingModal"
import GroupedElements from "./GroupedElements"

export default function App() {
  const [groupedElements, setGroupedElements] = useState([])
  const [isModalOpen, setIsModalOpen] = useState(false)

  useEffect(() => {
    getGroupedElements()
      .then(response => {
        setGroupedElements(response.data)
      }).catch(err => { console.log(err) })
  }, [])

  const onToggleModal = () => { setIsModalOpen(!isModalOpen) }

  return (
    <>
      <div className="mb-8 max-w-2xl lg:mx-auto space-y-4">
        <button
          onClick={onToggleModal}
          class="bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full"
        >
          Add Twitter account
        </button>
      </div>

      <AddTwitterFollowingModal isOpen={isModalOpen} onClose={onToggleModal} />
      <GroupedElements groups={groupedElements} />
    </>
  )
}
