class BankSystemController < ApplicationController

  def index
    @companies = Company.all
  end

  def transactions
  end

  def properties
  end

end
