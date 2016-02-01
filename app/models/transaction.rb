class Transaction < ActiveRecord::Base
  validates :description, presence: true
  validates :amount, presence: true
  validates :provider_id, presence: true
  validates :customer_id, presence: true
  validate :check_provider_and_customer
  validates_numericality_of :amount
  validates :amount, :numericality => {:greater_than_or_equal_to => 0 }

  def check_provider_and_customer
    errors.add(:customer_id, "must be different from provider") if customer_id == provider_id
  end

end
