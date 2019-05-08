class ChangeIntegerLimitInCoins < ActiveRecord::Migration
  def change
    change_column :coins, :market_cap, :integer, limit: 8
    change_column :coins, :volume_24h, :integer, limit: 8
  end
end
