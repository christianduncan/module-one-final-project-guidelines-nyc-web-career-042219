class Wallet < ActiveRecord::Base


  belongs_to :user
  belongs_to :coin

  # attr_accessor :coin_array
  #
  # def initialize
  #   @coin_array = []
  # end

end
