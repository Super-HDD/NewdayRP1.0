const imageElement = document.getElementById('fullscreenImage');

function closeImageDisplay() {
  imageElement.src = '';
  imageElement.style.display = 'none';
}

window.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'show') {
    imageElement.src = event.data.image;
    imageElement.style.display = 'block';
  } else {
    closeImageDisplay();
  }
});
