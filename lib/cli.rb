
# attr_accessor :current_user

def welcome
  puts "Welcome to Coin Wallet! What is your name?"
  current_user = gets.chomp
  User.find_or_create_by(:name => current_user)
  puts "welcome #{current_user}, what coin would you like to search for?"
  coin_selection = gets.chomp
  puts "#{current_user}, loading popular data for #{coin_selection}..."
  sleep(3)
  display_coin_info(coin_selection)

end

# def get_coin_from_user
#   puts "welcome #{@current_user}, what coin would you like to search for?"
#   gets.chomp = coin_selection
#   get_coindata(coin_selection)
# end





# def getusername
#   username = gets.chomp
#   current_user = User.find_by(username: username)
#
# end

# CLI.new.welcome
# CLI.new.getcoinfromuser
