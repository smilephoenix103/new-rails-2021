module HomeHelper
    def response_code(uri)
        resp = Net::HTTP.get_response(URI.parse(uri))

        # puts resp.code
        # puts resp.message
        # puts resp.class.name

        printf " ---------------------------------------------------------------------------\n"
        printf " |%-10s |%-25s |%-34s| \n","code", "message", "class name"
        printf " ---------------------------------------------------------------------------\n"
        printf " |%-10s |%-25s |%-34s| \n",resp.code, resp.message, resp.class.name
        printf " ------------------------------------------------------------------------------------------\n"
        # url = URI("https://pecunia-rails.herokuapp.com")
        # res = Net::HTTP.get_response(url)
        # puts res['Set-Cookie']
        # puts resp.get_fields('set-cookie')
        # puts res.to_hash['set-cookie']
        # puts "Headers: #{resp.to_hash.inspect}"
        # puts (resp.to_hash.keys[1])
        resp.to_hash.each do |h|
            printf " |%-30s |%55s |\n",h[0], h[1]
            puts " ------------------------------------------------------------------------------------------\n"
        end
        # # puts resp.to_hash.inspect
        # puts res.to_hash.inspect
        return resp.code
    end

    def percentage_change(i, j)
        if (j != nil)
            return ((j/i)-1)*-100
        else
            return 1
        end
    end

    def split_code(string_code)
        code_list = string_code.gsub(/\s+/, "").split(",")  #Usuwanie wszystkich spacji i dzielenie po przecinku do tabicy
        return code_list.map!(&:upcase)
    end
end
