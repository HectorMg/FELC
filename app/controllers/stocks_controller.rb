class StocksController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :delete]

  def index
    @stocks = Stock.all
    @participants = User.all
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    if ((stock_params[:name] != @stock.name) || (stock_params[:price] != @stock.price)) && ((stock_params[:name] != "") && (stock_params[:price] != ""))
      prev_price = @stock.price
      market_cap = stock_params[:price].to_f * @stock.total_quantity.to_f
      if @stock.update_attributes(stock_params) && @stock.update_attribute(:previous_price, prev_price) && @stock.update_attribute(:market_cap, market_cap)
        flash[:success] = "Stock successfully updated!"
        redirect_to @stock
      else
        render 'edit'
      end
    else
      render 'edit'
    end
  end

  def delete
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :price)
  end

  # Before action filters

  def admin_user
    redirect_to(company_bank_url) unless current_user.admin?
  end

end
