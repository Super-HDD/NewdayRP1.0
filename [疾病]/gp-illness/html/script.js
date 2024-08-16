$(function () {
    function display(bool) {
        if (bool) {
            $("#container").fadeIn(500);
        } else {
            $("#container").fadeOut(500);
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
})