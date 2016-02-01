class TransactionsController < ApplicationController

  def show
    @transaction = Transaction.find(params[:id])
    @customer = CompanyAccount.find(@transaction.customer_id)
    @provider = CompanyAccount.find(@transaction.provider_id)
    render :layout => "contract_layout"
  end

  def new_contract
    @transaction = Transaction.new
  end

  def new_copyright
    @transaction = Transaction.new
  end

  def stock_purchase
  end

  def stock_sale
  end

  def deposit
  end

  def withdraw
  end

  def create
    @transaction = Transaction.new(transaction_params)

    #Remove amount from customer
    @customer = CompanyAccount.find(@transaction.customer_id)
    customer_balance = @customer.balance
    #check for enough funds
    if @transaction.amount <= customer_balance
      customer_balance -= @transaction.amount
      charge = @customer.update_attribute(:balance, customer_balance)

      #Add amount to provider
      @provider = CompanyAccount.find(@transaction.provider_id)
      provider_balance = @provider.balance
      provider_balance += @transaction.amount
      pay = @provider.update_attribute(:balance, provider_balance)
    end
    if charge && pay
      completed_transaction = @transaction.save
    end

    if completed_transaction
      flash[:success] = ""
      render 'new_contract'
    else
      flash[:error] = ""
      render 'new_contract'
    end
  end

  private

    def transaction_params
      params.require(:transaction).permit(:description, :provider_id, :customer_id,
                                          :provider_role, :customer_role, :provider_consequence,
                                          :customer_consequence, :valid_through, :amount)
    end
end
