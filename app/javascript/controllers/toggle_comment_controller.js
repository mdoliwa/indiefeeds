import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "togglable", "toggleButton" ]
  static values = { expanded: Boolean, childrenCount: Number }

  toggle() {
    this.expandedValue ? this.hide() : this.expand()
  }

  hide() {
    this.expandedValue = false
    this.togglableTarget.classList.add('hidden')
    this.toggleButtonTarget.textContent = `[${this.childrenCountValue} more]`
  }

  expand() {
    this.expandedValue = true
    this.togglableTarget.classList.remove('hidden')
    this.toggleButtonTarget.textContent = '[–]'
  }
}
