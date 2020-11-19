import React from "react"

function enrichContent(content, uri) {
  return (
    <span>
      {content.substring(0, uri.indice_start)}
      <a
        href={uri.expanded_url}
        className="no-underline hover:underline text-blue-500"
        target="_blank"
        rel="noopener noreferrer"
      >
        {uri.display_url}
      </a>
      {content.substring(uri.indice_end)}
    </span>
  )
}

export default function Tweet({tweet}) {
  let {content} = tweet
  const {author, truncated, retweet, quote, uris} = tweet
  const {username} = author

  if(uris.length && !truncated && !retweet && !quote) {
    tweet.uris.forEach(uri => {
      content = enrichContent(content, uri)
    })
  }

  return (
    <>
      <div>
        <span className="p-1 text-blue-300 text-xs border rounded-lg bordert-blue-300">
          <a href={`https://twitter.com/${username}`}>
            @{username}
          </a>
        </span>
      </div>
      <p className="text-base text-blue-900">
        {content}
      </p>
    </>
  )
}
