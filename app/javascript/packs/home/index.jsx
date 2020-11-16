import React from "react"
import ReactDOM from "react-dom"
import PropTypes from "prop-types"

const App = ({count}) => (
  <div>Found {count} RSS feeds</div>
)

App.propTypes = {
  count: PropTypes.number
}

document.addEventListener("DOMContentLoaded", () => {
  fetch("/api/v1/rss_feeds").then(response => {
    if(response.ok) {
      response.json().then(json => {
        ReactDOM.render(
          <App count={json.data.length} />,
          document.body.appendChild(document.createElement("div")),
        )
      })
    } else {
      console.log("error")
    }
  })
  .catch(error => console.log(error.message))
})
