fx_version 'adamant'
games {"common"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


description "Polísek notify - library simple notify"

ui_page "html/index.html"

client_script "client_notify.lua"

export "Notification"
export "CustomNotification"

files {
    "html/index.html",
    "html/script.js",
    "html/main.css", 
}
