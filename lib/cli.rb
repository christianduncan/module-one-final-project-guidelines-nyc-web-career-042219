
# attr_accessor :current_user
#
# def welcome
#   puts "Welcome to Coin Wallet! What is your name?"
#   current_user = gets.chomp
#   User.find_or_create_by(:name => current_user)
#   puts "welcome #{current_user}, what coin would you like to search for?"
#   coin_selection = gets.chomp
#   puts "#{current_user}, loading popular data for #{coin_selection}..."
#   sleep(3)
#   display_coin_info(coin_selection)
#
# end

def welcome
  puts "Welcome to Coin Wallet! What is your name?"
  current_user = gets.chomp
  user_object = User.find_or_create_by(:name => current_user)
  user_id = User.last.id
  Wallet.find_or_create_by(:user_id => user_id)
  puts "welcome #{current_user}, what coin would you like to search for?"
  coin_selection = gets.chomp
  puts "#{current_user}, loading popular data for #{coin_selection}..."
  sleep(3)
  display_coin_info(coin_selection)
  buy_or_hold(coin_selection)
  puts "Would you like to see your wallet?"
  response = gets.chomp
  if response == "yes"
  puts User.last.wallets.inspect
  else
    puts "Thank you for using our app!"
  end
end

def buy_or_hold(coin_selection)
  puts "would you like add this #{coin_selection} to your wallet?(yes/no)"
  answer = gets.chomp
  case answer
  when "yes"
    puts "How many coins would you like to add?"
    how_many = gets.chomp.to_f
  coin_hash = get_coindata(coin_selection).flatten
  new_coin = Coin.create(:name => coin_selection,
    :price => coin_hash[1].to_d.truncate(2).to_f * how_many,
    :market_cap => coin_hash[11],
    :volume_24h => coin_hash[3],
    :change_24h => coin_hash[7].to_d.truncate(2).to_f)
    coin_id = Coin.last.id
    Wallet.update(:coin_id => coin_id, :value => new_coin.price,
      :performance => new_coin.change_24h)

  when "no"
    puts "Would you like to logout or quit (logout/quit)?"
    search_again = gets.chomp
    case search_again
    when "quit"

   else
     puts "Logging Out.."
     sleep(1)
     welcome
   end
 end
end
# adding a comment
