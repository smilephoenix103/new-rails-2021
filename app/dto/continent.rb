class Continent
    String @continent
    @country = CountryDto.new

    def initialize()
    end

    attr_accessor :continent, :country
end