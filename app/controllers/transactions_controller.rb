class TransactionsController < ApplicationController
  def new_contract
    @transaction = Transaction.new
  end

  def new_copyright
  end

  def stock_purchase
  end

  def stock_sale
  end

  def deposit
  end

  def withdraw
  end
end
