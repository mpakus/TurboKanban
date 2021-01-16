import Sortable from "sortablejs";
import {Controller} from "stimulus";
import Rails from '@rails/ujs';

import mergeParams from '../utils/Request';

export default class extends Controller {
  connect() {
    super.connect();

    this.sortable = Sortable.create(this.element, {
      handle: '.task-card',
      group: this.element.getAttribute('data-list-group'),
      animation: 150,
      onEnd: this.sorted.bind(this)
    })
  }

  sorted(event) {
    const board_id = document.getElementById('board_id').value;
    const task_id = event.item.dataset.id;
    const from_list_id = event.from.dataset.id;
    const params = {
      task: {
        position: event.newIndex + 1,
        list_id: event.to.dataset.id
      }
    };

    Rails.ajax({
      url: `/boards/${board_id}/tasks/${task_id}?from_list_id=${from_list_id}`,
      type: 'patch',
      data: mergeParams(params)
    })
  }
}
