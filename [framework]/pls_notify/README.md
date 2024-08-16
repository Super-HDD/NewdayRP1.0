# pls_notify - Easy notifications for RedM / FiveM

Simple notifications for RedM / FiveM

# Example

Default notification

Client
```
exports["pls_notify"]:Notification({  
        type="success", 
        title="Notification test",
        text="Notification description", 
        timeout=5000,
}) 
```

Server
```
TriggerClientEvent("pn:Notification", src, {  
        type="success", 
        title="Notification test",
        text="Notification description", 
        timeout=5000,
})
```

Custom notification

Client
```
exports["pls_notify"]:CustomNotification({  
        type = "success",
        title="Notification test", 
        text="Notification description",
        timeout=5000,
        class = "earleblack",
        showicon = true,
        stype = 3, 
}) 
```

Server
```
TriggerClientEvent("pn:CustomNotification", src, {  
        type = "success",
        title="Notification test", 
        text="Notification description",
        timeout=5000,
        class = "earleblack",
        showicon = true,
        stype = 3, 
})
```

# Types
success,
error,
warning,
info

# Custom classes
add to class = 

cordovan,
earleblack,
champane,
tealblue,
mdgreen,
pink1,
paradisepink,
beutypurple,
spacecadet,
smgreen,
blackcoral,
nicket
jet


redmstyle
redmstyle2
redmstyle3
redmstyle4


![image](https://user-images.githubusercontent.com/107623238/190398665-e97b21c3-3e75-4234-bcea-97d04cdd388c.png)
![image](https://user-images.githubusercontent.com/107623238/190398815-d997c5e7-5d21-4092-ab98-2ee8127244ed.png)
![image](https://user-images.githubusercontent.com/107623238/192103250-232aaacf-ff33-44b7-86a9-25799fc8c699.png)





# Screenshot

![image](https://user-images.githubusercontent.com/107623238/188313328-9cc1836d-c92c-4f1e-8023-aa5d033e769c.png)


# Used library

https://github.com/simple-notify/simple-notify
Thanks


# Support
- discord : https://discord.gg/VvRGG6rPCc
- email : polismanovicp@gmail.com
- support: https://paypal.me/Polisek?country.x=CZ&locale.x=cs_CZ

