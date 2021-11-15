module HomeHelper
    def response_code(uri)
        resp = Net::HTTP.get_response(URI.parse(uri))

        # puts resp.code
        # puts resp.message
        # puts resp.class.name

        printf " -----------------------------------------------------------------------\n"
        printf " |%-10s |%-25s |%-30s| \n","code", "message", "class name"
        printf " -----------------------------------------------------------------------\n"
        printf " |%-10s |%-25s |%-30s| \n",resp.code, resp.message, resp.class.name
        printf " -----------------------------------------------------------------------\n"
        # url = URI("https://pecunia-rails.herokuapp.com")
        # res = Net::HTTP.get_response(url)
        # puts res['Set-Cookie']
        # puts resp.get_fields('set-cookie')
        # puts res.to_hash['set-cookie']
        # puts "Headers: #{resp.to_hash.inspect}"
        # puts resp.to_hash.inspect
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
end
