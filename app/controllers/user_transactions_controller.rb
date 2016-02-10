class UserTransactionsController < ApplicationController

  before_action :admin_user, only: [:stock_purchase, :stock_sale, :create]
  before_action :own_transaction, only: :show

  def stock_purchase
    @transaction = UserTransaction.new()
    render :layout => "bank_system"
  end

  def stock_sale
    @transaction = UserTransaction.new()
    render :layout => "bank_system"
  end

  def show
  end

  def create

    @transaction = UserTransaction.new(user_transaction_params)
    #Stock Purchase
    if user_transaction_params[:description][0..8] == "Purchase"
      # Get user that is purchasing
      @user = User.find(user_transaction_params[:user_id])
      # Get amount of stock being purchased
      @stock_amount = params[:stock_amount]
      # Get transaction description
      @description = user_transaction_params[:description]
      # Get stock instance
      stock_id = params[:stock]
      @stock = Stock.find(stock_id)



      # Operations
      # Get total amount worth
      puts "Qty: #{@stock_amount} for #{@stock.price}"

      @amount = @stock_amount.to_f * @stock.price

      # Put amount in transaction

      @transaction.update_attribute(:amount, @amount)

      puts "#{@user.name} buys #{@stock_amount}  #{@stock.name} shares in #{@description} for a total of $ #{@amount}"

      # Remove amount from customer
      balance = @user.balance
      balance -= @amount.to_f
      charge = @user.update_attribute(:balance, balance)


      # Decrease stock qty in stock table

      stock_qty = @stock.quantity
      stock_qty -= @stock_amount.to_i
      decrease_stock_qty = @stock.update_attribute(:quantity, stock_qty)

      # FINISH STOCK PURCHASE AND ADD EXISTING STOCK TO STOCK TABLE BESIDES AVAILABLE STOCK

      # Update stock qty in user table

      if(stock_id == "1")
        if(@user.s1 == nil)
          @user.s1 = 0
        end
        userSQty = @user.s1
        userSQty += @stock_amount.to_i
        increase_stock = @user.update_attribute(:s1, userSQty)
      elsif(stock_id == "2")
        if(@user.s2 == nil)
          @user.s2 = 0
        end
        userSQty = @user.s2
        userSQty += @stock_amount.to_i
        increase_stock = @user.update_attribute(:s2, userSQty)
      elsif(stock_id == "3")
        if(@user.s3 == nil)
          @user.s3 = 0
        end
        userSQty = @user.s3
        userSQty += @stock_amount.to_i
        increase_stock = @user.update_attribute(:s3, userSQty)
      elsif(stock_id == "4")
        if(@user.s4 == nil)
          @user.s4 = 0
        end
        userSQty = @user.s4
        userSQty += @stock_amount.to_i
        increase_stock = @user.update_attribute(:s4, userSQty)
      elsif(stock_id == "5")
        if(@user.s5 == nil)
          @user.s5 = 0
        end
        userSQty = @user.s5
        userSQty += @stock_amount.to_i
        increase_stock = @user.update_attribute(:s5, userSQty)
      elsif(stock_id == "6")
        if(@user.s6 == nil)
          @user.s6 = 0
        end
        userSQty = @user.s6
        userSQty += @stock_amount.to_i
        increase_stock = @user.update_attribute(:s6, userSQty)
      elsif(stock_id == "7")
        if(@user.s7 == nil)
          @user.s7 = 0
        end
        userSQty = @user.s7
        userSQty += @stock_amount.to_i
        increase_stock = @user.update_attribute(:s7, userSQty)
      elsif(stock_id == "8")
        if(@user.s8 == nil)
          @user.s8 = 0
        end
        userSQty = @user.s8
        userSQty += @stock_amount.to_i
        increase_stock = @user.update_attribute(:s8, userSQty)
      end

      if charge && increase_stock && decrease_stock_qty
        completed_stock_purchase = @transaction.save
      end

    end

    if completed_stock_purchase
      flash[:success] = ""
      render 'stock_purchase'
    else
      flash[:error] = ""
      render 'stock_purchase'
    end
  end

  # Before action filters

  def admin_user
    redirect_to(company_bank_url) unless current_user.admin?
  end

  def own_transaction
    @transaction = UserTransaction.find(params[:id])
    if !belongs_to_user(@transaction)
      redirect_to(company_bank_url)
    end
  end

  private

    def user_transaction_params
      params.require(:user_transaction).permit(:description, :user_id, :amount, :stock)
    end
end
