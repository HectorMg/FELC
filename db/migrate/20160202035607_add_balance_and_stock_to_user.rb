class AddBalanceAndStockToUser < ActiveRecord::Migration
  def change
    add_column :users, :balance, :float
    add_column :users, :s1, :integer
    add_column :users, :s2, :integer
    add_column :users, :s3, :integer
    add_column :users, :s4, :integer
    add_column :users, :s5, :integer
    add_column :users, :s6, :integer
    add_column :users, :s7, :integer
    add_column :users, :s8, :integer
  end
end
