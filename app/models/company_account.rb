class CompanyAccount < ActiveRecord::Base
  has_many :users
  has_many :staffs
  has_many :sent_transactions, :class_name => 'Transaction', :foreign_key => 'provider_id'
  has_many :received_transactions, :class_name => 'Transaction', :foreign_key => 'customer_id'
end
