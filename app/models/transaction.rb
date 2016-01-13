class Transaction < ActiveRecord::Base
  belongs_to :provider, :class_name => 'CompanyAccount', :foreign_key => 'provider_id'
  belongs_to :customer, :class_name => 'CompanyAccount', :foreign_key => 'customer_id'
end
