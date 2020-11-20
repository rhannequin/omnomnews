import React from "react"

export default function RssFeedItem({item}) {
  return (
    <>
      <div>
        <svg className="w-4 h-4 align-middle inline-block mr-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8 8">
          <rect className="fill-current text-green-500" width="8" height="8" rx="1.5"/>
          <circle className="fill-current text-white" cx="2" cy="6" r="1"/>
          <path className="fill-current text-white" d="m 1,4 a 3,3 0 0 1 3,3 h 1 a 4,4 0 0 0 -4,-4 z" />
          <path className="fill-current text-white" d="m 1,2 a 5,5 0 0 1 5,5 h 1 a 6,6 0 0 0 -6,-6 z" />
        </svg>
        <span className="p-1 text-green-500 text-xs border rounded-lg border-green-500">
          {item.rss_feed.title}
        </span>
      </div>
      <a
        href={item.link}
        className="no-underline hover:underline text-blue-500"
        target="_blank"
        rel="noopener noreferrer"
      >
        {item.title}
      </a>
    </>
  )
}
