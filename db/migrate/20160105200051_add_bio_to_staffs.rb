class AddBioToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :bio, :text
  end
end
