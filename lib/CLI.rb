class Cli
    attr_accessor :user, :address
    
    def initialize
        @user=''
        @address=''
    end
    def welcome
        puts "Welcome to BLOCK PARTY"
        sleep(1)
        puts "Using any ethereum wallet you can gain access to your balance, latest ether prices, and more!"
        sleep(1) 
        ask_name
        system("clear")
        self.ask_for_address
        self.main_options
    end
    def ask_name
        puts "what is your name?"
        input=gets.strip
        @user << input
        system("clear")
    end
    
    def ask_for_address
        puts "Please enter a valid Eth Wallet Address to enter the program"
        input = gets.strip
        new_address = Etherscan.get_address(input)
        self.valid_address?(new_address)  
    end
    def valid_address?(address)
        if address.address.include? "Error! Invalid address format"
            puts "Error! Invalid address format"
            ask_for_address
        
        else
            @address = address.address.to_f
            self.display_balance
        end
        
    end
    def display_balance
        if @user == ''
            puts "Wallet Amount: #{@address}"
        else
            puts "#{@user}'s Wallet Amount: #{@address}"
        end
        
    end
    
    def main_options
        puts "Main Menu"
        puts "Enter a number for the corresponding selection"
        puts "1. Ethereum Price"
        puts "2. Gas Price"
        puts "3. Dispay Balance"
        puts "4. Exit"
        
        main_selection
    end
    def main_selection
        input = gets.strip
        if input == "1"
            price_check
        elsif input == "2"
            gas_price
        elsif input == "3"
            puts @address
            main_options
        elsif input == "4"
            exit
        end
    end
    
    def price_check    
        new_price = Etherscan.eth_price
        self.price_options(new_price)
    end
    def price_options(num)
        puts "PRICE CHECK!"
        puts "How would you like to view the current price of Ethereum?"
        puts "1. Eth to Btc"
        puts "2. Eth to Usd"
        puts "3. Back"
        self.price_selection(num)
    end
    def price_selection(prices)
        input = gets.strip
        if input == "1"
            puts "B #{prices.eth_btc.to_f}"
            price_check
        elsif input == "2"
            puts "$ #{prices.eth_usd.to_f}"
            price_check
        elsif input == "3"
            self.main_options

        else
            puts "^that^selection^was^invalid"
            self.price_options(prices)
        end
    end
    
    def gas_price
        gas = Etherscan.get_gas
        self.gas_options(gas)
        
    end
    def gas_options(gas)
        puts "The average gas price is #{gas.gas} Gwei"
        puts "Enter anything to return to the main menu"
        input = gets.strip
        if input
            self.main_options
        end
        system("clear")
    end

    def exit
        abort("Party on, Blockhead!")
    end
end