import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["button"];
  static values = { upvoted: Boolean, id: Number, resource: String }

  connect() {
    if (this.upvotedValue) {
      this.buttonTarget.classList.add('text-blue-500')
    }
  }

  upvote() {
    this.sendUpvoteRequest()
    this.toggle()
  }

  toggle() {
    this.buttonTarget.classList.toggle('text-blue-500')
  }

  sendUpvoteRequest() {
    let baseUrl = window.location.protocol + '//' + window.location.host
    let method = this.upvotedValue ? 'DELETE' : 'POST'
    let csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

    fetch(`${baseUrl}/${this.resourceValue}/${this.idValue}/upvotes`, {
      method: method,
      headers: { 'X-CSRF-Token': csrfToken },
    })

    this.upvotedValue = !this.upvotedValue
  }
}

