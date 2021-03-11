class ExchangeRate
    require 'json'

    def rate
        code_list = ["USD", "EUR", "CHF", "GBP"]

        source = 'https://api.nbp.pl/api/exchangerates/tables/a/?format=json'
        resp = Net::HTTP.get_response(URI.parse(source))
        data = resp.body
        result = JSON.parse(data)  
        
        objects = result.inject()
        rates = objects["rates"]

        
        @rates_list = Array.new

        rates.each do |r|
            rate = Rate.new
            rate.currency = r["currency"]
            rate.code = r["code"]
            rate.mid = r["mid"]

            code_list.each do |cod|
                if (cod == rate.code)
                @rates_list.push(rate)
                end
            end
        # printf " %-35s %-10s %-10s \n",rate.currency, rate.code, rate.mid
        # printf "%-20s %s\n", value_name, value
        end

        @exchange = Exchange.new
        @exchange.table = objects["table"]
        @exchange.no = objects["no"]
        @exchange.effectiveDate = objects["effectiveDate"]
        @exchange.rates = @rates_list

        @exchange.rates.each do |r|
            puts r
        end
        return @exchange
    end
end