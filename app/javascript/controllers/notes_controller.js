import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['note'];

  dragStart(event) {
    event.target.style.opacity = '0.4';
    this.dragSrcEl = event.target;

    event.dataTransfer.effectAllowed = 'move';
    event.dataTransfer.setData('text/html', event.target.innerHTML);
  }

  dragEnd(event) {
    this.resetOpacity();
  }

  dragOver(event) {
    event.preventDefault();
    return false;
  }

  dragEnter(event) {
    event.target.classList.add('over');

    event.preventDefault();

    return false;
  }

  dragLeave(event) {
    event.target.classList.remove('over');
    event.preventDefault();
    this.resetOpacity();
  }

  drop(event) {
    event.stopPropagation(); // stops the browser from redirecting.
    event.target.classList.remove('over');
    this.resetOpacity();

    fetch('/note_links', {
      method: 'POST',
      credentials: 'same-origin',
      headers: {
        Accept: 'text/vnd.turbo-stream.html',
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.head.querySelector('[name="csrf-token"]')
          .content,
      },
      body: JSON.stringify({
        source_id: this.dragSrcEl.dataset.id,
        target_id: event.target.dataset.id,
      }),
    })
      .then((response) => response.text())
      .then(Turbo.renderStreamMessage)
      .catch((error) => console.log(error));
  }

  resetOpacity() {
    this.noteTargets.forEach((note) => (note.style.opacity = '1'));
  }
}
