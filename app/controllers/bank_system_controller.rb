class BankSystemController < ApplicationController

  def index
    @company_accounts = CompanyAccount.all
  end

  def transactions
    @transactions = Transaction.all
  end

  def properties
  end

  def new_contract
    @transaction = Transaction.new()
  end

end
