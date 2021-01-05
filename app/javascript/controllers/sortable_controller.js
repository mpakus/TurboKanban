// import ApplicationController from './application_controller'
import Sortable from "sortablejs"
import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    super.connect();
    console.log('Sortable on: ', this.element);
    console.log('Group on: ', this.element.getAttribute('data-list-group'));

    this.sortable = Sortable.create(this.element, {
      handle: '.task-c',
      group: this.element.getAttribute('data-list-group'),
      animation: 150,
      onEnd: this.sorted.bind(this)
    })
    console.log(this.sortable);
  }

  sorted(event) {
    console.log('Sorted: ', event);
  }
}
