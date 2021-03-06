class BankSystemController < ApplicationController
  before_action :admin_user, only: [:index, :transactions, :properties]

  def index
    @company_accounts = CompanyAccount.all
  end

  def transactions
    @transactions = Transaction.all
    @user_transactions = UserTransaction.all
  end

  def properties
    @properties = Property.all
  end

  def stock_mkt
    @stocks = Stock.all
  end

  def stock_edit
    @stock = Stock.all
  end

  def settings

  end

  # Before action filters

  def admin_user
    redirect_to(company_bank_url) unless current_user.admin?
  end

end
