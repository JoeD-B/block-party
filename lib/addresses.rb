class Addresses
    attr_accessor :address, :eth_usd, :eth_btc, :gas

    @@all = []

    def initialize(hash)
        @address = hash[:address]
        @eth_usd = hash[:eth_usd]
        @eth_btc = hash[:eth_btc]
        @gas = hash[:gas]
        
    end

    def self.all
        @@all << self
    end

end