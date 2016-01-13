class RenameCompaniesToCompanyAccounts < ActiveRecord::Migration
  def change
    rename_table :companies, :company_accounts
  end
end
