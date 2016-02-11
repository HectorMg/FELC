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

    # Get user's transactions
    @all_user_transactions = UserTransaction.all
    @user_transactions = []
    @all_user_transactions.each do |t|
      if t.user_id == @user.id
        @user_transactions << t
      end
    end

    #Get all stock
    @stock = Stock.all

    #Put user stock info into array
    @user_stock = [@user.s1, @user.s2, @user.s3, @user.s4, @user.s5, @user.s6, @user.s7, @user.s8]

  end

  def stock
  end
end
