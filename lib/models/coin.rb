
class Coin < ActiveRecord::Base

  attr_accessor :users

  has_many :wallets
  has_many :users, through: :wallets



end
