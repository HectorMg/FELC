class UserTransaction < ActiveRecord::Base
  belongs_to :user

  validates :description, presence: true
  validates :user_id, presence: true
  validates_numericality_of :amount #Also checks for presence
  validates :amount, :numericality => {:greater_than_or_equal_to => 0 }

end
