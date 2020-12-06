import React, { useState } from "react"

import { postTwitterFollowing } from "../core/api"
import { postRssFeed } from "../core/api"
import Alert from "../core/components/Alert"

import TwitterModal from "./TwitterModal"
import RssFeedModal from "./RssFeedModal"

export default function Actions() {
  const [isTwitterModalOpen, setIsTwitterModalOpen] = useState(false)
  const [isRssFeedModalOpen, setIsRssFeedModalOpen] = useState(false)

  const [
    displayTwitterSuccessMessage,
    setDisplayTwitterSuccessMessage
  ] = useState(false)

  const [
    displayRssFeedSuccessMessage,
    setDisplayRssFeedSuccessMessage
  ] = useState(false)

  const toggleTwitterModal = () => { setIsTwitterModalOpen(!isTwitterModalOpen) }
  const toggleRssFeedModal = () => { setIsRssFeedModalOpen(!isRssFeedModalOpen) }

  const renderAddTwitterFollowingSuccessAlert = () => {
    setDisplayTwitterSuccessMessage(true)
    setTimeout(() => { setDisplayTwitterSuccessMessage(false) }, 4000)
  }

  const renderAddRssFeedSuccessAlert = () => {
    setDisplayRssFeedSuccessMessage(true)
    setTimeout(() => { setDisplayRssFeedSuccessMessage(false) }, 4000)
  }

  const addTwitterFollowingRequest = (username, fail) => {
    postTwitterFollowing(username)
      .then(() => {
        toggleTwitterModal()
        renderAddTwitterFollowingSuccessAlert()
      })
      .catch(fail)
  }

  const addRssFeedRequest = (uri, fail) => {
    postRssFeed(uri)
      .then(() => {
        toggleRssFeedModal()
        renderAddRssFeedSuccessAlert()
      })
      .catch(fail)
  }

  return (
    <>
      <div className="mb-8 max-w-2xl lg:mx-auto space-y-4">
        {displayTwitterSuccessMessage && (
          <Alert status="success" title="Success">
            <p>
              Twitter account successfully added, data will be synchronized soon.
            </p>
          </Alert>
        )}
        {displayRssFeedSuccessMessage && (
          <Alert status="success" title="Success">
            <p>
              RSS feed successfully added, data will be synchronized soon.
            </p>
          </Alert>
        )}
        <div className="text-center">
          <button
            onClick={toggleTwitterModal}
            className="mr-1 bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full"
          >
            Add Twitter account
          </button>
          <button
            onClick={toggleRssFeedModal}
            className="bg-green-400 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-full"
          >
            Add RSS feed
          </button>
        </div>
      </div>

      {isTwitterModalOpen && (
        <TwitterModal
          request={addTwitterFollowingRequest}
          onClose={toggleTwitterModal}
        />
      )}
      {isRssFeedModalOpen && (
        <RssFeedModal
          request={addRssFeedRequest}
          onClose={toggleRssFeedModal}
        />
      )}
    </>
  )
}
