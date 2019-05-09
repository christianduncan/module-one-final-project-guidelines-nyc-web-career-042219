
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
  puts "What coin would you like to search for?"
  coin_selection = gets.chomp
  puts "loading popular data for #{coin_selection}..."
  sleep(3)
  display_coin_info(coin_selection)
  buy_or_hold(coin_selection)
end

def buy_or_hold(coin_selection)
  puts "would you like add this #{coin_selection} to your wallet?(yes/no)"
  answer = gets.chomp
  case answer
  when "yes"
    puts "What is your name?"
    current_user = gets.chomp
    user_object = User.find_or_create_by(:name => current_user)
    user_id = User.last.id
    Wallet.find_or_create_by(:user_id => user_id)
    puts "#{current_user}, how many coins would you like to add?"
    how_many = gets.chomp.to_i
  coin_hash = get_coindata(coin_selection).flatten
  new_coin = Coin.create(:name => coin_selection,
    :price => coin_hash[1].to_d.truncate(2).to_f,
    :market_cap => coin_hash[11],
    :volume_24h => coin_hash[3],
    :change_24h => coin_hash[7].to_d.truncate(2).to_f)
    coin_id = Coin.last.id
    Wallet.update(:coin_id => coin_id, :value => new_coin.price,
      :performance => new_coin.change_24h)
      user_object.coins = []
      how_many.times do user_object.coins << new_coin end
      user_object.coins
      puts "Would you like to see your wallet?"
      response = gets.chomp
      if response == "yes"
        counter = 0
      user_object.coins.each do |coin|
        counter += 1
        puts "#{counter}, Coin Name: #{coin[:name]}, Coin Price: #{coin[:price]}
        Daily Change: #{coin[:change_24h]}%"
      end
        welcome
      end

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
