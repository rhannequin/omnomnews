import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { message: String }

  confirm(event) {
    console.log("hello")
    if (!(window.confirm(this.messageValue))) {
      event.preventDefault()
      event.stopImmediatePropagation()
    }
  }
}
