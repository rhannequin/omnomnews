import React from "react"
import ReactDOM from "react-dom"
import PropTypes from "prop-types"

import axios from "../core/axios"

const App = ({count}) => (
  <div>Found {count} RSS feeds</div>
)

App.propTypes = {
  count: PropTypes.number
}

document.addEventListener("DOMContentLoaded", () => {
  axios
    .get("/api/v1/rss_feeds")
    .then(response => {
      const data = response.data.data
      ReactDOM.render(
        <App count={data.length} />,
        document.body.appendChild(document.createElement("div")),
      )
    })
})
