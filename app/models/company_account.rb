class CompanyAccount < ActiveRecord::Base
  has_many :users
  has_many :staffs
  has_many :transactions
end
