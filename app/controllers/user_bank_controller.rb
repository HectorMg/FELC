class UserBankController < ApplicationController
  def index
    @user = current_user
    @account = CompanyAccount.find(@user.company_account_id)
    @all_transactions = Transaction.all
    @transactions = []
    @all_transactions.each do |t|
      if t.customer_id == @account.id || t.provider_id == @account.id
        @transactions << t
      end
    end
  end

  def stock
  end
end
