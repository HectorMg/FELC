class AddDefaultValuesToCopyrights < ActiveRecord::Migration
  def change
    change_column :copyrights, :active, :boolean, :default => false
    change_column :copyrights, :deactivated, :boolean, :default => false
  end
end
