class CompanyAccount < ActiveRecord::Base
  has_many :users
  has_many :staffs
  has_many :properties
  has_many :copyrights
end
