import React, { useState } from "react"

import { postTwitterFollowing } from "../core/api"
import Alert from "../core/components/Alert"

import TwitterModal from "./TwitterModal"

export default function Actions() {
  const [isTwitterModalOpen, setIsTwitterModalOpen] = useState(false)

  const toggleModal = () => { setIsTwitterModalOpen(!isTwitterModalOpen) }

  const renderAddTwitterFollowingSuccessAlert = () => {
    setDisplayTwitterSuccessMessage(true)
    setTimeout(() => { setDisplayTwitterSuccessMessage(false) }, 4000)
  }

  const addTwitterFollowingRequest = (username, fail) => {
    postTwitterFollowing(username)
      .then(() => {
        toggleModal()
        renderAddTwitterFollowingSuccessAlert()
      })
      .catch(fail)
  }

  const [
    displayTwitterSuccessMessage,
    setDisplayTwitterSuccessMessage
  ] = useState(false)

  return (
    <>
      <div className="js-actions mb-8 max-w-2xl lg:mx-auto space-y-4">
        {displayTwitterSuccessMessage && (
          <Alert status="success" title="Success">
            <p>
              Twitter account successfully added, data will be synchronized soon.
            </p>
          </Alert>
        )}
        <button
          onClick={toggleModal}
          className="bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full"
        >
          Add Twitter account
        </button>
      </div>

      {isTwitterModalOpen && (
        <TwitterModal
          request={addTwitterFollowingRequest}
          onClose={toggleModal}
        />
      )}
    </>
  )
}
