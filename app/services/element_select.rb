class ElementSelect < ActiveRecord::Base
    # Enumerator
    enum status: ["KOLEKCJA", "FOR SELL", "SOLD", "RESERVATION", "NEW", "FUTURE"]

    enum making: ["Papier", "Polimer", "Hybryda"]

    enum img_type: ["Skan", "Foto", "LOC", "WWW" ]

    enum unit_quantity: ["szt", "set"]

    enum order_status: %w(Open Close Reservatoin)

    enum shipment_type: ["Register Priority", "Economic Registered", "InPost Parcel Locker", "Pickup In person"]

end