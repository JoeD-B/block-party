

class Etherscan

    @@api_key = "CD7JVPJE3PK97QDU7EW9KCDX7C8YHKGGF1"

    @@url = ["https://api.etherscan.io/api?module=stats&action=ethprice&apikey=#{@@api_key}","https://api.etherscan.io/api?module=account&action=balance&address=0xddbd2b932c763ba5b1b7ae3b362eac3e8d40121a&tag=latest&apikey=#{@@api_key}"]

    def self.eth_price
        response = HTTParty.get(@@url[0])
        binding.pry 
       
    end
    #def self.address_balance

    
end