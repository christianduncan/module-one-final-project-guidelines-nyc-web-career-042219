
class Coin < ActiveRecord::Base
  has_many :wallets
  has_many :users, through: :wallets
  


end
