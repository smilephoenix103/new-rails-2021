class Exchange
    String @table
    String @no
    String @effectiveDate
    rates = Array.new
    def initialize()
    end
    # def initialize(table, no, effectiveDate, rates)
    #     @table = table
    #     @no = no
    #     @effectiveDate = effectiveDate
    #     @rates = Array.new
    # end
    attr_reader :table, :no, :effectiveDate, :rates
    attr_writer :table, :no, :effectiveDate, :rates

    def to_s
        "Exchange: #{@table}, #{@no}, #{@effectiveDate}}."
    end
end	