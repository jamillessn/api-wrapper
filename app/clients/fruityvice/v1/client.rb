class Fruityvice::V1::Client
    BASE_URL = 'https://www.fruityvice.com/api/'.freeze

    ERROR_CODES = {
    400 => 'Bad Request',
    401 => 'Unauthorized',
    403 => 'Forbidden',
    404 => 'Not Found',
    429 => 'Too Many Requests',
    500 => 'Internal Server Error',
    502 => 'Bad Gateway',
    503 => 'Service Unavailable',
    504 => 'Gateway Timeout'
  }.freeze

 def getFruits
    request(
        method: "get",
        endpoint: "fruit/all",
    )
 end

 def getFruit(name)
    request(
        method: "get",
        endpoint: "/fruit/#{name}",
    )
 end

 def getFruitFunFact(name)
    request(
        method: "get",
        endpoint: "/fruit/#{name}/fun-facts",
    )
 end
    
 private

    def request(method:, endpoint:, params: {})
        begin
        res = connection.public_send(method, "#{endpoint}") do |req|
            params.each do |k, v|
            req.params[k] = v
            end
        end
        return JSON.parse(res.body) if res.success?

        rescue Faraday::ConnectionFailed => e
            puts "Connection failed: #{e}"
        rescue JSON::ParserError => e
            puts "Error parsing JSON: #{e}"
        end
        
        return nil 
    end

    def connection
        @connection ||= Faraday.new(url: BASE_URL)
    end
end