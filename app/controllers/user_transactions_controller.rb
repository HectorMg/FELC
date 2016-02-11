class UserTransactionsController < ApplicationController

  before_action :admin_user, only: [:stock_purchase, :stock_sale, :create]
  before_action :own_transaction, only: :show

  def stock_purchase
    @transaction = UserTransaction.new()
    @stock = Stock.all
  end

  def stock_sale
    @transaction = UserTransaction.new()
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

      @amount = @stock_amount.to_f * @stock.price

      # Put amount in transaction

      @transaction.amount = @amount

      final_desc = "Purchased #{@stock_amount}  #{@stock.name} shares valued at #{@stock.price}"
      @transaction.description = final_desc
      # Remove amount from customer
      balance = @user.balance
      balance -= @amount.to_f
      @user.balance = balance
      charge = (@user.balance == balance)

      # Decrease stock qty in stock table

      stock_qty = @stock.quantity
      stock_qty -= @stock_amount.to_i
      @stock.quantity = stock_qty
      decrease_stock_qty = (@stock.quantity == stock_qty)

      # FINISH STOCK PURCHASE AND ADD EXISTING STOCK TO STOCK TABLE BESIDES AVAILABLE STOCK

      # Update stock qty in user table

      if(stock_id == "1")
        if(@user.s1 == nil)
          @user.s1 = 0
        end
        userSQty = @user.s1
        userSQty += @stock_amount.to_i
        @user.s1 = userSQty
        increase_stock = (@user.s1 == userSQty)
      elsif(stock_id == "2")
        if(@user.s2 == nil)
          @user.s2 = 0
        end
        userSQty = @user.s2
        userSQty += @stock_amount.to_i
        @user.s2 = userSQty
        increase_stock = (@user.s2 == userSQty)
      elsif(stock_id == "3")
        if(@user.s3 == nil)
          @user.s3 = 0
        end
        userSQty = @user.s3
        userSQty += @stock_amount.to_i
        @user.s3 = userSQty
        increase_stock = (@user.s3 == userSQty)
      elsif(stock_id == "4")
        if(@user.s4 == nil)
          @user.s4 = 0
        end
        userSQty = @user.s4
        userSQty += @stock_amount.to_i
        @user.s4 = userSQty
        increase_stock = (@user.s4 == userSQty)
      elsif(stock_id == "5")
        if(@user.s5 == nil)
          @user.s5 = 0
        end
        userSQty = @user.s5
        userSQty += @stock_amount.to_i
        @user.s5 = userSQty
        increase_stock = (@user.s5 == userSQty)
      elsif(stock_id == "6")
        if(@user.s6 == nil)
          @user.s6 = 0
        end
        userSQty = @user.s6
        userSQty += @stock_amount.to_i
        @user.s6 = userSQty
        increase_stock = (@user.s6 == userSQty)
      elsif(stock_id == "7")
        if(@user.s7 == nil)
          @user.s7 = 0
        end
        userSQty = @user.s7
        userSQty += @stock_amount.to_i
        @user.s7 = userSQty
        increase_stock = (@user.s7 == userSQty)
      elsif(stock_id == "8")
        if(@user.s8 == nil)
          @user.s8 = 0
        end
        userSQty = @user.s8
        userSQty += @stock_amount.to_i
        @user.s8 = userSQty
        increase_stock = (@user.s8 == userSQty)
      end

      if charge && increase_stock && decrease_stock_qty
        completed_stock_purchase = @transaction.save && @user.save && @stock.save
      end

      if completed_stock_purchase
        flash[:success] = ""
        render 'user_transactions/stock_purchase'
      else
        flash[:error] = ""
        render 'user_transactions/stock_purchase'
      end
    end

    #Stock Sale
    if user_transaction_params[:description][0..8] == "Sale"
      # Get user that is selling
      @user = User.find(user_transaction_params[:user_id])
      # Get amount of stock being sold
      @stock_amount = params[:stock_amount]
      # Get transaction description
      @description = user_transaction_params[:description]
      # Get stock instance
      stock_id = params[:stock]
      @stock = Stock.find(stock_id)


      # Operations
      # Get total amount worth

      @amount = @stock_amount.to_f * @stock.price

      # Put amount in transaction

      @transaction.amount = @amount

      final_desc = "Sold #{@stock_amount}  #{@stock.name} shares valued at #{@stock.price}"
      @transaction.description = final_desc

      # Add amount to customer
      balance = @user.balance
      balance += @amount.to_f
      @user.balance = balance
      pay = (@user.balance == balance)

      # Increase stock qty in stock table

      stock_qty = @stock.quantity
      stock_qty += @stock_amount.to_i
      @stock.quantity = stock_qty
      increase_stock_qty = (@stock.quantity == stock_qty)

      # FINISH STOCK PURCHASE AND ADD EXISTING STOCK TO STOCK TABLE BESIDES AVAILABLE STOCK

      # Update stock qty in user table

      if(stock_id == "1")
        if(@user.s1 == nil || @user.s1 == 0 || @user.s1 < @stock_amount.to_i)
          decrease_stock = false;
          puts decrease_stock
        else
          userSQty = @user.s1
          userSQty -= @stock_amount.to_i
          @user.s1 = userSQty
          decrease_stock = (@user.s1 == userSQty)
        end
      elsif(stock_id == "2")
        if(@user.s2 == nil || @user.s2 == 0 || @user.s2 < @stock_amount.to_i)
          decrease_stock = false;
          puts decrease_stock
        else
          userSQty = @user.s2
          userSQty -= @stock_amount.to_i
          @user.s2 = userSQty
          decrease_stock = (@user.s2 == userSQty)
        end
      elsif(stock_id == "3")
        if(@user.s3 == nil || @user.s3 == 0 || @user.s3 < @stock_amount.to_i)
          decrease_stock = false;
          puts decrease_stock
        else
          userSQty = @user.s3
          userSQty -= @stock_amount.to_i
          @user.s3 = userSQty
          decrease_stock = (@user.s3 == userSQty)
        end
      elsif(stock_id == "4")
        if(@user.s4 == nil || @user.s4 == 0 || @user.s4 < @stock_amount.to_i)
          decrease_stock = false;
          puts decrease_stock
        else
          userSQty = @user.s4
          userSQty -= @stock_amount.to_i
          @user.s4 = userSQty
          decrease_stock = (@user.s4 == userSQty)
        end
      elsif(stock_id == "5")
        if(@user.s5 == nil || @user.s5 == 0 || @user.s5 < @stock_amount.to_i)
          decrease_stock = false;
          puts decrease_stock
        else
          userSQty = @user.s5
          userSQty -= @stock_amount.to_i
          @user.s5 = userSQty
          decrease_stock = (@user.s5 == userSQty)
        end
      elsif(stock_id == "6")
        if(@user.s6 == nil || @user.s6 == 0 || @user.s6 < @stock_amount.to_i)
          decrease_stock = false;
          puts decrease_stock
        else
          userSQty = @user.s6
          userSQty -= @stock_amount.to_i
          @user.s6 = userSQty
          decrease_stock = (@user.s6 == userSQty)
        end
      elsif(stock_id == "7")
        if(@user.s7 == nil || @user.s7 == 0 || @user.s7 < @stock_amount.to_i)
          decrease_stock = false;
          puts decrease_stock
        else
          userSQty = @user.s7
          userSQty -= @stock_amount.to_i
          @user.s7 = userSQty
          decrease_stock = (@user.s7 == userSQty)
        end
      elsif(stock_id == "8")
        if(@user.s8 == nil || @user.s8 == 0 || @user.s8 < @stock_amount.to_i)
          decrease_stock = false;
          puts decrease_stock
        else
          userSQty = @user.s8
          userSQty -= @stock_amount.to_i
          @user.s8 = userSQty
          decrease_stock = (@user.s8 == userSQty)
        end
      end

      if pay && decrease_stock && increase_stock_qty
        completed_stock_sale = @transaction.save && @user.save && @stock.save
        puts completed_stock_sale
      end

      if completed_stock_sale
        flash[:success] = ""
        render 'user_transactions/stock_sale'
      else
        flash[:error] = ""
        render 'user_transactions/stock_sale'
      end
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
