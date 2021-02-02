class Cli
    def initialize
        @user=''
    end
    def welcome
       puts "welcome!"
        
        #ask_name
        self.ask_for_address
    end
    #def ask_name
     #   puts "what is your name?"
      #  input=gets.strip
       # @user << input
        #system("clear")
        #puts @user
    #end


    def ask_for_address
        puts "Enter your wallet address below"
        Etherscan.eth_price
        #input = gets.strip
        #do something with address
    end
end