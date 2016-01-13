class Staff < ActiveRecord::Base
  belongs_to :user
  belongs_to :company_account
end
