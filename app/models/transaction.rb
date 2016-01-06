class Transaction < ActiveRecord::Base
  belongs_to :provider, :class_name => 'Company', :foreign_key => 'provider_id'
  belongs_to :customer, :class_name => 'Company', :foreign_key => 'customer_id'
end
