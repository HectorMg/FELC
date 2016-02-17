class AddsTotalSharesToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :total_quantity, :integer
  end
end
