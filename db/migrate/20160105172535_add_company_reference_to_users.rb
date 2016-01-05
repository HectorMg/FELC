class AddCompanyReferenceToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :company, index: true, foreign_key: true
    add_index :users, [:company_id, :created_at]
  end
end
