import React from "react"

export default function RssFeeds({rssFeeds}) {
  return (
    <>
      {rssFeeds && rssFeeds.map((rssFeed, i) => (
        <p key={i} className="mt-4 max-w-2xl text-xl leading-7 text-gray-500 lg:mx-auto">
          {rssFeed.attributes.title}
        </p>
      ))}
    </>
  )
}
