class User < ActiveRecord::Base

  attr_accessor :coins

  has_many :wallets
  has_many :coins, through: :wallets



# attr_accessor :bank

# def inititalize
#   @bank = []
# end


end
