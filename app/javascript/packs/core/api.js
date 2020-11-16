import axios from "./axios"

const API_BASE = "/api/v1"
const RSS_FEEDS_ENDPOINT = "/rss_feeds"

export const getRssFeeds = () => {
  return new Promise((resolve, reject) => {
    axios
      .get(API_BASE + RSS_FEEDS_ENDPOINT)
      .then(response => { resolve(response.data) }, reject)
  })
}
