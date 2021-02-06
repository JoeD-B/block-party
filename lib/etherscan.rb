

class Etherscan

    @@api_key = "CD7JVPJE3PK97QDU7EW9KCDX7C8YHKGGF1"

    @@url = ["https://api.etherscan.io/api?module=stats&action=ethprice&apikey=#{@@api_key}"]

    

    def self.get_address(wallet)
        url = "https://api.etherscan.io/api?module=account&action=balance&address=#{wallet}&tag=latest&apikey=#{@@api_key}"
        response = HTTParty.get(url)
        address_hash = {address: response["result"]}
        Addresses.new(address_hash)
    end

    def self.get_gas
        url = "https://api.etherscan.io/api?module=gastracker&action=gasoracle&apikey=#{@api_key}"
        response = HTTParty.get(url)
        gas_hash = {gas: response["result"]["SafeGasPrice"]}
        Addresses.new(gas_hash)
    end

    def self.eth_price
        response = HTTParty.get(@@url[0])
        ethereum_hash = {eth_usd: response["result"]["ethusd"],eth_btc: response["result"]["ethbtc"]}
        Addresses.new(ethereum_hash)
    end
end