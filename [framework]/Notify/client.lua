function Alert(title, message, time, type)
	SendNUIMessage({
		action = 'open',
		title = title,
		type = type,
		message = message,
		time = time,
	})
end

RegisterNetEvent('Ultra-Notify:Alert')
AddEventHandler('Ultra-Notify:Alert', function(title, message, time, type)
	Alert(title, message, time, type)
end)

---[ EXAMPLE NOTIFY (DELETE THIS BELOW) ]---




---[ ALL IN ONE NOTIFY (DELETE THIS BELOW) ]---

RegisterCommand('allnoty', function()
	exports['Ultra-Notify']:Alert("SUCCESS", "Ultra Dev", 5000, 'success')
	exports['Ultra-Notify']:Alert("INFORMATION", "Ultra Dev", 5000, 'info')
	exports['Ultra-Notify']:Alert("ERROR", "Ultra Dev", 5000, 'error')
	exports['Ultra-Notify']:Alert("NEW SMS", "Ultra Dev", 5000, 'warning')
	exports['Ultra-Notify']:Alert("TWITTER", "Ultra Dev", 5000, 'sms')
	exports['Ultra-Notify']:Alert("SAVED", "Ultra Dev", 5000, 'long')
end)

AddEventHandler('onResourceStart', function()
    if resourcesname == "Ultra-Notify" then
print("Ultra Dev")
print("Ultra Dev")

print("Ultra Dev")print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")

print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")
print("Ultra Dev")

    end
end)
