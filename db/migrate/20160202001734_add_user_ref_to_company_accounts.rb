class AddUserRefToCompanyAccounts < ActiveRecord::Migration
  def change
    add_reference :company_accounts, :user, index: true, foreign_key: true
  end
end
