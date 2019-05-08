

def getdata
  response = RestClient::Request.execute(
     :method => :get,
     :url => "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest",
     :headers => {'X-CMC_PRO_API_KEY' => "e1bc2b6a-0db8-4d6f-af85-907403dfa668"} #e1bc2b6a-0db8-4d6f-af85-907403dfa668
  )
  string = response.body
  data_hash = JSON.parse(string)
  data_hash
end

  def get_coindata(coin_name)

    coin_data = getdata
    # binding.pry
    individual_coins = coin_data['data'].select { |coin| coin['name'].downcase == coin_name.downcase }

    individual_coins.map {|coins_hash| coins_hash['quote']['USD'].flatten}

  end

  def display_coin_info(coin_name)
    coin_hash = get_coindata(coin_name).flatten
    puts "*" * 15
    puts "Price: #{coin_hash[1].to_d.truncate(2).to_f}"
    puts "*" * 15
    puts "Market Cap: #{coin_hash[11].to_i}"
    puts "*" * 15
    puts "Volume: #{coin_hash[3].to_d.truncate(2).to_f}"
    puts "*" * 15
    puts "Daily Percent Change: #{coin_hash[7].to_d.truncate(2).to_f}%"
    puts "*" * 15
    puts "Weekly Percent Change: #{coin_hash[9].to_d.truncate(2).to_f}%"
    puts "*" * 15
  end
