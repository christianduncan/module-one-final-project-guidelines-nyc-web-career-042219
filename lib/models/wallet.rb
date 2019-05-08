class Wallet < ActiveRecord::Base


  belongs_to :users
  belongs_to :coins

  # attr_accessor :coin_array
  #
  # def initialize
  #   @coin_array = []
  # end

end
