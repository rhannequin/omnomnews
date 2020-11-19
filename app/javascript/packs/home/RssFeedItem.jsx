import React from "react"

export default function RssFeedItems({item}) {
  const {title, link} = item

  return (
    <li>
      <div>
        <span className="p-1 text-blue-300 text-xs border rounded-lg bordert-blue-300">
          {item.rss_feed.title}
        </span>
      </div>
      <a
        href={link}
        className="no-underline hover:underline text-blue-500"
        target="_blank"
        rel="noopener noreferrer">
        {title}
      </a>
    </li>
  )
}
