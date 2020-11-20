import React from "react"


export default function RetweetTag({author, url}) {
  return (
    <span className="p-1 leading-3 text-xs border rounded-lg border-green-300">
      <svg
        className="w-4 h-4 align-middle inline-block mr-1"
        viewBox="0 1 20 20"
        version="1.1"
        xmlns="http://www.w3.org/2000/svg"
      >
        <g
          className="fill-current text-green-300"
          stroke="none"
          strokeWidth="1"
          fill="none"
          fillRule="evenodd"
        >
          <g>
            <path
              d="M4.99201702,4 C3.8918564,4 3,4.88670635 3,5.99810135 L3,12 L0,12 L4,16 L8,12 L5,12 L5,6 L12,6 L14,4 L4.99201702,4 Z M15,8 L12,8 L16,4 L20,8 L17,8 L17,14.0018986 C17,15.1054196 16.0998238,16 15.007983,16 L6,16 L8,14 L15,14 L15,8 Z"
            ></path>
          </g>
        </g>
      </svg>
      <a
        href={url}
        className="text-green-300"
        target="_blank"
        rel="noopener noreferrer"
      >
        @{author}
      </a>
    </span>
  )
}
