# RexshackGaming
- discord : https://discord.gg/s5uSk56B65
- github : https://github.com/Rexshack-RedM

# QB Bird Post Telegram
- based on Faroeste-Roleplay Peagle (frp_peagle)

# Dependencies
- qb-core
- qb-menu
- qb-input

# Features
Compared to the original frp_peagle, this resource has many more new features, i.e:
- Fully integrated into QB Telegram
- Change bird model to any birds we want
- Notification to sender when the letter is delivered successfully
- Notification to recipient when the Bird Post is approaching
- Notification to recipient when he/she is inside a building
- Notification to recipient when he/she is on a horse and about to pick up the letter
- Auto resurrect the bird when it dies before the letter is sent successfully
- Set bird arrival delay (default is 20 seconds)
- Bird timeout (default is 180 seconds). When timeout reached, the bird will fail to deliver the letter and the recipient
  can retrieve the letter on the nearby 邮局
- Optimised loops and fully optimised logics, will only run when the target person is getting a Bird Post approaching
- Animation for writing and sending the letter
- Bird Post blip (with blue colout) for the recipient to be able to detect Bird Post position
- Send letter to ourself for debugging/testing purpose
- QB Core Framework Locales support
- Fully integrated into qb-hud
- The bird will follow the target person anywhere until he/she picks up the letter (until the timeout we set reached)
- Automatic resource cleanup for 'ensure' freaks like myself
- The bird may stuck at the tall building, that's RDR2 feature. There's no bird flying on the cities, so whenever a
  Bird Post is coming we'll be notified to stay away from any buildings
- More improvements to come later
- etc

# TL;DR
A bird to send post letter to anyone currently online

# Credits
- Faroeste-Roleplay (for the original frp_peagle)
- RexShack / RexShack#3041 (for the original QB Telegram)
- MOVZX / Goghor#9453 (conversions, optimisations, additions, etc)