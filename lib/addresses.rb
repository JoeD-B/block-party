class Addresses
    attr_accessor :address, :eth_usd, :eth_btc

    @@all = []

    def initialize(hash)
       # -mass assignment method for later expansion- 
       # hash.each do |key, value|
       #     self.send("#{key}=", value) if self.respond_to?("#{key}=")
       # end  
        @address = hash[:address]
        @eth_usd = hash[:eth_usd]
        @eth_btc = hash[:eth_btc]
        
    end

    def self.all
        @@all << self
    end

end