class User < ActiveRecord::Base
  has_many :wallets
  has_many :coins, through: :wallets




end
