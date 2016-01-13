class Transaction < ActiveRecord::Base
  belongs_to :provider, :class_name => 'CompanyAccount'
  belongs_to :customer, :class_name => 'CompanyAccount'
end
