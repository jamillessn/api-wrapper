class Fruityvice::Client
    BASE_URL = 'https://www.fruityvice.com/api/'.freeze

 def fruits(page =1, page_size=4)
    request(
        method: "get",
        endpoint: "fruits/all",
        params: { page: page, page_size: page_size }
    )
 end

 def fruit(id)
    request(
        method: "get",
        endpoint: "fruits/#{id}"
    )
 end

 private

    def request(method:, endpoint:, params:{})
        res = connection.public_send(method, "#{endpoint}") do |req|
            params.each do |k,v|
                req.params[k] = v
            end
        end
        return JSON.parse(res.body) if res.success?
        
    end

    def connection
        @connection ||= Faraday.new(url: BASE_URL)
    end
end