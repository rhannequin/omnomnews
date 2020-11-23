import React from "react"

import Alert from "./Alert"

export default function ModalErrorAlert({ errors }) {
  return (
    <Alert status="error" title="Error">
      <ul className="list-disc">
        {errors.map((error, i) => (
          <li key={i}>
            {error.attribute} {error.messages.join(", ")}
          </li>
        ))}
      </ul>
    </Alert>
  )
}
