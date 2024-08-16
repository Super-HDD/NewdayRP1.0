window.addEventListener("message", function(event){   
    if(event.data.options.style == "default"){
        new Notify({
            status: event.data.options.type,
            title: event.data.options.title,
            text: event.data.options.text,
            effect: 'fade',
            speed: 300,
            showIcon: true,
            showCloseButton: false,
            autoclose: true,
            autotimeout:event.data.timeout,
            gap: 20,
            distance: 20,
            type: 3,
            position: 'right y-center'
          })
    }else{
        new Notify({
            status: event.data.options.type,
            title: event.data.options.title,
            text: event.data.options.text,
            effect: 'fade',
            speed: 300,
            customClass: event.data.options.class,
            customIcon: null,
            showIcon: event.data.options.sicon,
            showCloseButton: false,  
            autoclose: true,   
            autotimeout:event.data.timeout,
            gap: 20,
            distance: 20,
            type: event.data.styletype,
            position: 'right y-center'
          })
    }

}); 
