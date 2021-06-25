class ElementSelect < ActiveRecord::Base
    # Enumerator
    enum status: ["KOLEKCJA", "FOR SELL", "SOLD", "RESERVATION", "NEW", "FUTURE"]

    enum making: ["Papier", "Polimer", "Hybryda"]

    enum img_type: ["Skan", "Foto", "LOC", "WWW" ]

end