import axios from "./axios"

const API_BASE = "/api/v1"
const GROUPED_ELEMENTS_ENDPOINT = "/grouped_elements"
const CREATE_TWITTER_FOLLOWING_ENDPOINT = "/twitter_followings"
const CREATE_RSS_FEED_ENDPOINT = "/rss_feeds"

export const getRssFeeds = () => {
  return new Promise((resolve, reject) => {
    axios
      .get(API_BASE + RSS_FEEDS_ENDPOINT)
      .then(response => { resolve(response.data) }, reject)
  })
}

export const getGroupedElements = () => {
  return new Promise((resolve, reject) => {
    axios
      .get(API_BASE + GROUPED_ELEMENTS_ENDPOINT)
      .then(response => { resolve(response.data) }, reject)
  })
}

export const postTwitterFollowing = (params) => {
  return new Promise((resolve, reject) => {
    axios
      .post(API_BASE + CREATE_TWITTER_FOLLOWING_ENDPOINT, params)
      .then(response => { resolve(response.data) }, reject)
  })
}

export const postRssFeed = (params) => {
  return new Promise((resolve, reject) => {
    axios
      .post(API_BASE + CREATE_RSS_FEED_ENDPOINT, params)
      .then(response => { resolve(response.data) }, reject)
  })
}
