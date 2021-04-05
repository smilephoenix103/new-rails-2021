class ElementSelect < ActiveRecord::Base
    # Enumerator
    enum status: ["KOLEKCJA", "FOR SELL", "SOLD", "RESERVATION"]

    enum making: ["PAPIER", "POLIMER", "HYBRYDA"]

    enum img_type: ["SKAN", "FOTO", "LOC", "WWW" ]

end