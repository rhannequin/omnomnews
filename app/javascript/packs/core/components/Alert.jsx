import React from "react"

const STATUSES = {
  error: "bg-red-500",
  success: "bg-green-500",
}

export default function Alert({ status, title, children }) {
  const color = STATUSES[status]

  return (
    <div className={`text-white px-6 py-4 border-0 rounded relative mb-4 ${color}`}>
      <span className="inline-block align-middle mr-8">
        <b>{title}</b>
      </span>
      {children}
    </div>
  )
}
