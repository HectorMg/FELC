class CompanyAccountsController < ApplicationController
  def index
  end

  def show
    @company_account = CompanyAccount.find(params[:id])
    @staffs = Staff.all
    if @company_account.transactions.any?
      @transactions = @company_account.transactions.all
    else
      @transactions = Transaction.all
    end
  end
end
