$(function() {
  function vehicleDisplay(bool) {
    if (bool) {
      $('#car-hud').show();
    } else {
      $('#car-hud').hide();
    }
  }

  vehicleDisplay(false)

  window.addEventListener('message', function(event) {
    var item = event.data;
    if (item.type === 'carHud') {
      if (item.status == true) {
        vehicleDisplay(true)
      } else {
        vehicleDisplay(false)
      }
    }
  })
})




window.addEventListener('message', (event) => {
	let data = event.data
	if(data.action == 'name') {
    document.querySelector('#name > span').innerText = data.name;
	}

  
  if (data.action == 'hideCarHud') {
    document.getElementById('carhud').hide;
  } 
  else if (data.action == 'showCarHud') {
    document.getElementById('carhud').hide;
  }
})

window.addEventListener('message', (event) => {
	let data = event.data
	if(data.action == 'updateCarHud') {
    document.querySelector('#speed > span').innerText = data.time;
    document.querySelector('#fuel > span').innerText = data.zone;
	}

})

window.addEventListener('message', (event) => {
	let data = event.data
	if(data.action == 'job') {
    document.querySelector('#job > span').innerText = data.job;
   
	}

})

window.addEventListener('message', (event) => {
	let data = event.data
	if(data.action == 'bank') {
    document.querySelector('#bank > span').innerText = data.bank;
   
	}

})


window.addEventListener('message', (event) => {
	let data = event.data
	if(data.action == 'cash') {
    document.querySelector('#cash > span').innerText = data.cash;
   
	}

})

window.addEventListener('message', (event) => {
	let data = event.data
	if(data.action == 'black') {
    document.querySelector('#black > span').innerText = data.black;
   
	}

})


