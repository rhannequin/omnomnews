import React, { useState, useEffect } from "react"

import { getRssFeeds } from "../core/api"

import RssFeeds from "./RssFeeds"

export default function App() {
  const [rssFeeds, setRssFeeds] = useState()

  useEffect(() => {
    getRssFeeds()
    .then(response => { setRssFeeds(response.data) })
    .catch(err => { console.log(err) })
  }, [])

  return (
    <RssFeeds rssFeeds={rssFeeds} />
  )
}
