class ContinentDto
    String @continent
    countries = Array.new

    def initialize()
    end

    attr_accessor :continent, :countries
end