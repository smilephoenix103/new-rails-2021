class ListElement
    def initialize
        @statuses = Array.new
        @makings = Array.new
        @img_types = Array.new

        @statuses = ["KOLEKCJA", "FOR SELL", "SOLD", "RESERVATION"]
        @makings = ["Papier", "Polimer", "Hybryda", "Pozłacany", "Inny"]
        @img_types = ["SKAN", "FOTO", "LOC", "WWW"]
    end
    
   
    attr_reader :statuses, :makings, :img_types

    def getStatus
        return @statuses.to_s
    end

    def getMakings
        return @makings.to_s
    end

    def getImg_type
        return @img_types.to_s
    end
end