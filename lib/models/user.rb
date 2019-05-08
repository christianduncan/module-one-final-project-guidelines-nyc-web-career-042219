class User < ActiveRecord::Base

  has_many :wallets
  has_many :coins, through: :wallets



# attr_accessor :bank

# def inititalize
#   @bank = []
# end


end
