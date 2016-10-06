class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def reset_event
    #Reset User Accounts
    @participants = User.participants
    @participants.each do |p|
      p.balance = 1500
      p.s1 = 0
      p.s2 = 0
      p.s3 = 0
      p.s4 = 0
      p.s5 = 0
      p.s6 = 0
      p.s7 = 0
      p.s8 = 0
      p.save 
    end

    #Reset all Transactions
    Transaction.delete_all

    #Reset Company Accounts
    @companies = CompanyAccount.all
    @companies.each do |c|
      c.balance = 1500
      c.save
    end

    #Reset copyrights
    Copyright.delete_all

    #Reset properties
    @properties = Property.all
    @properties.each do |p|
      p.bought_at = p.price
      p.company_account_id = 9
      p.save
    end

    #Reset Stock
    @stocks = Stock.all
    @stocks.each do |s|
      s.quantity = 500
      s.price = 25
      s.previous_price = 0
      s.market_cap = 125000
      s.save
    end
    redirect_to "bank"
  end

end
