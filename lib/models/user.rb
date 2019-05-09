class User < ActiveRecord::Base

  attr_accessor :coins

  has_many :wallets
  has_many :coins, through: :wallets


# def coins
#   my_wallets = Wallet.all.where("user_id = id")
#   coinids = my_wallets.map {|wallet| wallet.coin_id}
#   Coin.all.where("Coin.all.include?(coinids)")
# end
# attr_accessor :bank

# def inititalize
#   @bank = [
# end


end
