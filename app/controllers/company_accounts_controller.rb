class CompanyAccountsController < ApplicationController
  def index
  end

  def show
    @company_account = CompanyAccount.find(params[:id])
    @staffs = Staff.all
    if @company_account.received_transactions.any? || @company_account.sent_transactions.any?
      @transactions = @company_account.received_transactions.all + @company_account.sent_transactions.all
    end
  end
end
