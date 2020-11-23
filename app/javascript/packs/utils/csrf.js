export const HEADER_KEY = "X-CSRF-Token"

const tokenEl = document.querySelector("meta[name=csrf-token]")
const token = tokenEl == null ? null : tokenEl.getAttribute("content")

export const TOKEN = token
