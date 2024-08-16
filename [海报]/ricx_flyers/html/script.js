$("body").fadeOut(0);
window.addEventListener('message', function(event) {
    if (event.data.action == "showFlyer"){
        $("#image").attr("src","");
        $("body").hide(0);
        $("#image").attr("src",event.data.image);
        $("body").fadeIn(0);
    }
    else if (event.data.action == "hideFlyer"){
        $("body").fadeOut(0);
    }
});