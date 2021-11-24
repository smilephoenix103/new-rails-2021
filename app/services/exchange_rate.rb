class ExchangeRate
  require 'json'
  include HomeHelper

  def rate(source)
    @setting = Setting.find_by(name: "Currency Cod")
    puts @setting.inspect
    if (@setting != nil)
      # code_list = @setting.value.gsub(/\s+/, "").split(",")  #Usuwanie wszystkich spacji i dzielenie po przecinku do tabicy
      # code_list.map!(&:upcase)
      code_list = split_code(@setting.value)
    else
      code_list = %w(USD EUR CHF GBP)
    end

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
    end

    @exchange = Exchange.new
    @exchange.table = objects["table"]
    @exchange.no = objects["no"]
    @exchange.effectiveDate = objects["effectiveDate"]
    @exchange.rates = @rates_list

    @exchange.rates.each do |r|
      puts r.to_s
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
      puts" ------------------------------------------------------------"
      printf " | %-15s | %-10s | %-14s | %-9s| \n","Data", "Cena/g", "Cena/Oz", "Zmiana"
      @rates_gold_list.each.with_index do |g, i|
        @i = @rates_gold_list[i].price_for_gram
        @j = @rates_gold_list[i-1].price_for_gram
        g.change = percentage_change(@i, @j)
        puts g.to_s
      end
      puts" ------------------------------------------------------------"
      return @rates_gold_list.drop(1)
    else
      puts "ERROR 404"
      return false
    end

  end
end