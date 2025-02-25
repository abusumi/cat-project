import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "results"]

  connect() {
    this.resultsTarget.style.display = 'none';
  }

  search(event) {
    const query = event.target.value.trim();

    if (query.length < 1) {
      this.hideResults();
      return;
    }

    fetch(`/brands/autocomplete?query=${encodeURIComponent(query)}`)
      .then(response => response.json())
      .then(data => {
        this.updateResults(data);
      })
      .catch(error => console.error(" Fetch Error:", error));
  }

  updateResults(data) {
    if (!data.length) {
      this.hideResults();
      return;
    }

    this.resultsTarget.innerHTML = data.map(item => `
      <li class="px-4 py-2 hover:bg-gray-100 cursor-pointer" 
          data-action="click->autocomplete#select"
          data-name="${item.name}">
        <span class="font-medium">${item.name}</span>
      </li>
    `).join('');

    this.showResults();
  }

  select(event) {
    const name = event.target.closest('li').dataset.name;
    this.inputTarget.value = name;
    this.hideResults();
  }

  showResults() {
    this.resultsTarget.style.display = 'block';
  }

  hideResults() {
    this.resultsTarget.style.display = 'none';
    this.resultsTarget.innerHTML = '';
  }
}
