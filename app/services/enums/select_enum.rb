class SelectEnum < ApplicationRecord
    # Enumerator
    enum status: ["KOLEKCJA", "FOR SELL", "SOLD", "RESERVATION"]
    enum making: ["Papier", "Polimer", "Hybryda", "Pozłacany", "Inny"]
    enum img_type: ["SKAN", "FOTO", "LOC", "WWW"]
  end