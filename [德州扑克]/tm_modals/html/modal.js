var currentModal = undefined
var showNUI = false
$(function () {
    // event listeners
    window.addEventListener("message", function (event) {
        // enable/disbale NUI
        if (event.data.type == "ui") { 
            if (event.data.status) {
                currentModal = event.data.modal
                $("#result").val("")
                $("#modal-title").html(currentModal.title)
                $("#modal-desc").html(currentModal.desc)
                if (currentModal.accept) {
                    $("#modal-accept").css("width","50%")
                    $("#modal-accept").html(currentModal.accept)
                    $("#modal-accept").show()
                } else {
                    $("#modal-cancel").css("width","100%")
                    $("#modal-accept").hide()
                }
                if (currentModal.cancel) {
                    $("#modal-cancel").css("width","50%")
                    $("#modal-cancel").html(currentModal.cancel)
                    $("#modal-cancel").show()
                } else {
                    $("#modal-accept").css("width","100%")
                    $("#modal-cancel").hide()
                }
                if (currentModal.icon) {
                    $("#modal-icon").html('<img src="' + currentModal.icon + '"/>');
                    $("#modal-icon").show()
                } else {
                    $("#modal-icon").empty()
                    $("#modal-icon").hide()
                }
                if (currentModal.inputfield) {
                    $("#result").val("")
                    $("#modal-content").show()
                } else {
                    $("#modal-content").hide()
                }

                $("body").fadeIn(100);
            } else {
                $("body").fadeOut(100);
                currentModal = undefined
            }
            showNUI = event.data.status
        }
    });

    // Key listender for closing
    window.addEventListener("keyup", function (event) {
        if (event.key == "Escape" && showNUI) {
            $.post("http://tm_modals/sendResult", JSON.stringify("__closeModal"));
        }
    });

    // modal buttons
    $("#modal-cancel").on('click', function (e) {
        $.post("http://tm_modals/sendResult", JSON.stringify("__closeModal"));
    })
    $("#modal-accept").on('click', function (e) {
        var result = $("#result").val()
        $.post("http://tm_modals/sendResult", JSON.stringify(result));
    })
})
