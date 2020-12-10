import React from "react"
import { DialogOverlay, DialogContent } from "@reach/dialog"

export default function Modal({ariaLabel, onDismiss, children}) {
  return (
    <DialogOverlay
      onDismiss={onDismiss}
      dangerouslyBypassScrollLock
      className="overflow-hidden bg-black bg-opacity-75 fixed inset-0 opacity-100"
      style={{ zIndex: 90 }}
    >
      <DialogContent
        aria-label={ariaLabel}
        className="rounded-md relative max-w-lg bg-white outline-none overflow-hidden w-11/12 my-20 mx-auto"
        style={{ maxHeight: "calc(100% - 48px)" }}
      >
        {children}
      </DialogContent>
    </DialogOverlay>
  )
}
