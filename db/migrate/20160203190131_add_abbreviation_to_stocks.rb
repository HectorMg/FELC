class AddAbbreviationToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :abbrev, :string
  end
end
