-- FOR QBR, RSG
ALTER TABLE players
ADD illnesses TEXT DEFAULT '[]';

-- FOR VoRP
ALTER TABLE characters
ADD illnesses TEXT DEFAULT '[]';