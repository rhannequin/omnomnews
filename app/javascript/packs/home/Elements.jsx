import React from "react"

import Element from "./Element"

export default function Elements({elements}) {
  return (
    <>
      {elements.length && (
        <ul className="mb-8 max-w-2xl lg:mx-auto space-y-4">
          {elements.map((element, i) => (
            <Element key={i} element={element} />
          ))}
        </ul>
      )}
    </>
  )
}
