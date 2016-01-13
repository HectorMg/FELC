class FixReferencesBetweenTransactionsAndCompanies < ActiveRecord::Migration
  def change
    remove_column :transactions, :provider_id
    remove_column :transactions, :customer_id
  end
end
