document.addEventListener("DOMContentLoaded", () => {
  const toggleVisibility = (element, state) => {
    element.classList.add(state ? "hidden" : "block")
    element.classList.remove(state ? "block" : "hidden")
  }

  const toggleMobileMenu = (e) => {
    const button = e.currentTarget
    const menu = document.querySelector(".js-mobile-menu")
    const openedIcon = document.querySelector(".js-opened-icon")
    const closedIcon = document.querySelector(".js-closed-icon")

    const openState = button.getAttribute("aria-expanded") === "true"

    toggleVisibility(menu, openState)
    toggleVisibility(closedIcon, !openState)
    toggleVisibility(openedIcon, openState)

    button.setAttribute("aria-expanded", !openState)
  }

  document.querySelector(".js-menu").addEventListener("click", toggleMobileMenu)
})
