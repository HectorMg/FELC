require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  def setup
    @customer = CompanyAccount.create(id: 10, balance: 100)
    @transaction = Transaction.new(description: "Test transaction", amount: 100, provider_id: 1, customer_id: 10)
  end

  test "should be valid" do
    assert @transaction.valid?
  end

  test "description should be present" do
    @transaction.description = "     "
    assert_not @transaction.valid?
  end

  test "provider should be present" do
    @transaction.provider_id = nil
    assert_not @transaction.valid?
  end

  test "customer should be present" do
    @transaction.customer_id = nil
    assert_not @transaction.valid?
  end

  test "provider and customer should be different" do
    @transaction.customer_id = 1
    @transaction.provider_id = 1
    assert_not @transaction.valid?
  end

  test "amount should be present and a float" do
    @transaction.amount = "asdfas"
    assert_not @transaction.valid?
  end

  test "amount should be positive" do
    @transaction.amount = "-100"
    assert_not @transaction.valid?
  end


end
