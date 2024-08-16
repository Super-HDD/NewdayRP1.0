#DON'T RENAME SCRIPT !

#THIS EXPORTS ARE CLIENT ONLY

Get illnesses and diseases from player
exports['gp-illness']:GetIllnesses() 

Cure player from any infection and disease
exports['gp-illness']:CurePlayer()

Cure player from specific disease
exports['gp-illness']:CurePlayerFromIllness('illnessname')

Infect player with specific disease
exports['gp-illness']:InfectPlayer('illnessname')

Get players vulnerability
exports['gp-illness']:GetPlayerVulnerability()

Set players vulnerability
exports['gp-illness']:SetPlayerVulnerability(newValue)

#DEBUG COMMANDS

/getillness -- WILL PRINT OUT TABLE INTO CONSOLE BY WHAT UR INFECT

/getillflu -- INFECT WITH FLU

/getillrabies -- INFECT WITH FLU

/cure -- WILL CURE YOU

/vomit -- SYMPTOM

/cough -- SYMPTOM

/sweat -- SYMPTOM

/chills -- SYMPTOM

/coma -- SYMPTOM

/fear -- SYMPTOM

/cramps -- SYMPTOM