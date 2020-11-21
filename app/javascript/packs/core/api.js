import axios from "./axios"

const API_BASE = "/api/v1"
const GROUPED_ELEMENTS_ENDPOINT = "/grouped_elements"

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
