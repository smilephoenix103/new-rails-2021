class Rate
    String @currency
    String @code
    Float @mid = 0
    def initialize()
    end
    # def initialize(currency, code, mid)
    #     @currency = currency
    #     @code = code
    #     @mid = mid
    # end
    attr_reader :currency, :code, :mid
    attr_writer :currency, :code, :mid

    def to_s
        printf " %-35s %-10s %-10s",@currency, @code, @mid
    end
end	