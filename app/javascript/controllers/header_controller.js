import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["toggleable"]

  connect() {
    this.toggleClass = "hidden"
  }

  toggleMobileMenu() {
    this.toggleableTargets.forEach(target => {
      target.classList.toggle(this.toggleClass)
    })
  }
}
