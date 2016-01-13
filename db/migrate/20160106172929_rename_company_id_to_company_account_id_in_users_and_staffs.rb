class RenameCompanyIdToCompanyAccountIdInUsersAndStaffs < ActiveRecord::Migration
  def change
    rename_column :users, :company_id, :company_account_id
    rename_column :staffs, :company_id, :company_account_id
  end
end
