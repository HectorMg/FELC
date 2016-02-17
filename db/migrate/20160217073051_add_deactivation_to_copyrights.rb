class AddDeactivationToCopyrights < ActiveRecord::Migration
  def change
    add_column :copyrights, :deactivated, :boolean
  end
end
