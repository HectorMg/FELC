class CompanyAccountsController < ApplicationController
  def index
  end

  def destroy
    CompanyAccount.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to 'bank_system/index'
  end

  def show
    @company_account = CompanyAccount.find(params[:id])
    @staffs = Staff.all
    all_transactions = Transaction.all
    @transactions = []

    all_transactions.each do |t|
      if (t.customer_id == @company_account.id || t.provider_id == @company_account.id )
        @transactions << t
      end
    end
  end

  def reset_accounts
    @companies = CompanyAccount.all
    @companies.each do |company|
      company.balance = 1500
      company.save
    end
    redirect_to '/bank'
  end
end
