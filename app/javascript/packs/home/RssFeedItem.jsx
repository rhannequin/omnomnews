import React from "react"

export default function RssFeedItems({item}) {
  const {title, link, published_at} = item.attributes

  return (
    <li className="py-4">
      <span className="uppercase text-xs font-sans tracking-wide font-bold block text-gray-500">
        <time>{new Date(published_at).toDateString()}</time>
      </span>
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
