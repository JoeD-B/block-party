class Cli
    attr_accessor :user
    def initialize
        @user=''
    end
    def welcome
       puts "welcome!"
        
        ask_name
        self.ask_for_address
    end
    def ask_name
        puts "what is your name?"
        input=gets.strip
        @user << input
        system("clear")
        puts @user
    end


    def ask_for_address
        puts "Enter your wallet address below"
        input = gets.strip
        new_address = Etherscan.get_address(input)
        
        new_price = Etherscan.eth_price
        self.price_options(new_price)
        #do something with address
        binding.pry
    end
   


    def price_options(prices)
        puts "Please choose how you would like to convert..."
        puts "1. ETH to BTC"
        puts "2. ETH to USD"
        self.menu_selection(prices)
    end

    def menu_selection(prices)
        input = gets.strip
        if input == "1"
            puts "B #{prices.eth_btc.to_f}"
        elsif input == "2"
            puts "$ #{prices.eth_usd.to_f}"
        else
            puts "that selection was invalid"
            self.price_options(prices)
        end

        binding.pry
    end




end