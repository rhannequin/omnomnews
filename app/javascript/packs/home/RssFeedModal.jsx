import React, { useState } from "react"

import Modal from "../core/components/Modal"
import ModalErrorAlert from "../core/components/ModalErrorAlert"

export default function RssFeedModal({ request, onClose }) {
  const [uri, setUri] = useState("")
  const [errors, setErrors] = useState([])

  const onUriChange = (e) => {
    setUri(e.currentTarget.value)
  }

  const onSubmit = (e) => {
    e.preventDefault()
    request({ rss_feed: { uri: uri } }, err => {
      setErrors(err.response.data.errors)
    })
  }

  return (
    <Modal ariaLabel="add-rss-feed" onDismiss={onClose}>
      <div className="js-rss-feed-modal bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
        {errors.length > 0 && (
          <ModalErrorAlert errors={errors} />
        )}
        <div className="sm:flex sm:items-start">
          <div
            className="mx-auto flex-shrink-0 flex items-center justify-center h-12 w-12 rounded-full bg-green-100 sm:mx-0 sm:h-10 sm:w-10"
          >
            <svg
              className="w-12 h-12 fill-current text-green-400 align-middle inline-block"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
            >
              <path d="M12 2c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm-1.29 14.646c0 .748-.607 1.354-1.354 1.354-.749 0-1.356-.606-1.356-1.354 0-.747.607-1.353 1.355-1.353.748.001 1.355.606 1.355 1.353zm-2.71-5.237v2.004c2.521.025 4.567 2.068 4.592 4.587h2.008c-.026-3.629-2.965-6.566-6.6-6.591zm0-1.404c4.407.02 7.98 3.581 7.993 7.995h2.007c-.012-5.513-4.48-9.981-10-10v2.005z"/>
            </svg>
          </div>
          <div className="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
            <h3 className="text-lg leading-6 font-medium text-gray-900">
              Add a new RSS feed
            </h3>
            <div className="mt-2">
              <p className="text-sm text-gray-500">
                Enter the URI of a RSS feed you want to follow
              </p>
            </div>
          </div>
        </div>
        <form className="mt-8 space-y-6" onSubmit={onSubmit}>
          <div className="rounded-md shadow-sm -space-y-px">
            <div>
              <label
                htmlFor="rss-feed-uri"
                className="sr-only"
              >
                RSS feed URI
              </label>
              <div className="mt-1 flex rounded-md shadow-sm">
                <input
                  id="rss-feed-uri"
                  type="text"
                  value={uri}
                  onChange={onUriChange}
                  required
                  placeholder="e.g. https://weblog.rubyonrails.org/feed/atom.xml"
                  className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-r-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                />
              </div>
            </div>
          </div>
          <div className="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
            <button
              type="submit"
              className="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-green-600 text-base font-medium text-white hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm"
            >
              Add
            </button>
            <button
              onClick={onClose}
              type="button"
              className="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm"
            >
              Cancel
            </button>
          </div>
        </form>
      </div>
    </Modal>
  )
}
