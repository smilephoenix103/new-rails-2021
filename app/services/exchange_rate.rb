class ExchangeRate
    require 'json'
    include HomeHelper

    # def response_code
    #     source = 'https://api.nbp.pl/api/exchangerates/tables/a/?format=json'     
    #     resp = Net::HTTP.get_response(URI.parse(source))
    #     puts resp.code
    #     puts resp.message
    #     puts resp.class.name
    #     return resp.code
    # end

    def rate(source)
        code_list = %w(USD EUR CHF GBP)
        # source = 'https://api.nbp.pl/api/exchangerates/tables/a/?format=json'               
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

    def rate_gold(source)
        resp = Net::HTTP.get_response(URI.parse(source))
        if (resp.code == "200")
            data = resp.body
            result = JSON.parse(data)

            @rates_gold_list = Array.new

            result.each do |g|
                rate_gold = RateGold.new
                rate_gold.date = g["data"]
                rate_gold.price_for_gram = g["cena"]
                rate_gold.price_for_ounce = g["cena"] * 31.1
                @rates_gold_list.push(rate_gold)
            end
            printf " %-35s %-10s %-10s %20s \n","Data", "Cena/g", "Cena/Oz", "Zmiana"
            @rates_gold_list.each do |g|
                puts g.to_s
            end
        return @rates_gold_list
        else
            puts "ERROR 404"
            return false
        end

    end
end