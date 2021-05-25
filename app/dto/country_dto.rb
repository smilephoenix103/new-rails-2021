class CountryDto
    Integer @id = 0
    String @country_en
    String @capital_city
    
    
    def initialize()
    end
    # def initialize(country_en, capital_city)
    #     @country_en = counrty_en
    #     @capital_city = capital_city
    # end
    # attr_reader :counrty_en, :capitalCity
    # attr_writer :counrty_en, :capitalCity
    attr_accessor :id, :counrty_en, :capital_city

    # def to_s
    #     "Exchange: #{@table}, #{@no}, #{@effectiveDate}}."
    # end
end	