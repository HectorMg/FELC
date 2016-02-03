class UserBankController < ApplicationController
  def index
    # Get logged in user
    @user = current_user
    # Get user's company account
    @account = CompanyAccount.find(@user.company_account_id)
    # Get user's company account's transactions
    @all_transactions = Transaction.all
    @transactions = []
    @all_transactions.each do |t|
      if t.customer_id == @account.id || t.provider_id == @account.id
        @transactions << t
      end
    end
    # Get user's company account's properties
    @properties = []
    @all_properties = Property.all
    @all_properties.each do |property|
      if property.company_account_id == @account.id
        @properties << property
      end
    end

    #Get all stock
    @stock = Stock.all
  end

  def stock
  end
end
