import React from "react"

export default function RssFeedItem({item}) {
  return (
    <>
      <div>
        <span className="p-1 text-blue-300 text-xs border rounded-lg bordert-blue-300">
          {item.rss_feed.title}
        </span>
      </div>
      <a
        href={item.link}
        className="no-underline hover:underline text-blue-500"
        target="_blank"
        rel="noopener noreferrer">
        {item.title}
      </a>
    </>
  )
}
