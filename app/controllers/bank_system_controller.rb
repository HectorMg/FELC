class BankSystemController < ApplicationController

  def index
    @companies = Company.all
  end

  def transactions
    @transactions = Transaction.all
  end

  def properties
  end

end
