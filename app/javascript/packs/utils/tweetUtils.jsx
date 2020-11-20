import React from "react"

export const enrichTweetContent = (tweetContent, tweetUris) => {
  let splittedContent = [tweetContent]
  const result = []

  tweetUris.forEach(uri => {
    splittedContent =
      splittedContent.map(substring => substring.split(uri.url)).flat()
  })

  splittedContent.forEach((substring, i) => {
    const uri = tweetUris[i]

    result.push(substring)
    if(uri) {
      result.push(
        <a
          key={i}
          href={uri.expanded_url}
          className="no-underline hover:underline text-blue-500"
          target="_blank"
          rel="noopener noreferrer"
        >
          {uri.display_url}
        </a>
      )
    }
  })

  return result
}
