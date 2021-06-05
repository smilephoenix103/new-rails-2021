module HomeHelper
    def response_code(uri)
        resp = Net::HTTP.get_response(URI.parse(uri))
        puts resp.code
        puts resp.message
        puts resp.class.name

        # url = URI("https://pecunia-rails.herokuapp.com")
        # res = Net::HTTP.get_response(url)
        # puts res['Set-Cookie']
        # puts res.get_fields('set-cookie')
        # puts res.to_hash['set-cookie']  
        # puts "Headers: #{res.to_hash.inspect}"
        # puts res.to_hash.inspect
        # puts res.to_hash.inspect
        return resp.code
    end
end
