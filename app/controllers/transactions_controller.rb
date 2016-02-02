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

  def cbt
    @transaction = Transaction.new()
  end

  def create
    @transaction = Transaction.new(transaction_params)

    # For deposits only (move to helper)
    if transaction_params[:description] == "Deposit"
      # Add amount to company account
      @provider = CompanyAccount.find(@transaction.provider_id)
      provider_balance = @provider.balance
      provider_balance += @transaction.amount
      # Change amount in table
      deposit = @provider.update_attribute(:balance, provider_balance)

      # Add amount to cash box counter
      @cashbox = CompanyAccount.find(9)
      cashbox_balance = @cashbox.balance
      cashbox_balance += @transaction.amount
      #Change amount in table
      receive = @cashbox.update_attribute(:balance, cashbox_balance)
    # For withdrawals only (move to helper)
    elsif transaction_params[:description] == "Withdrawal"
      # Add amount to company account
      @customer = CompanyAccount.find(@transaction.customer_id)
      customer_balance = @customer.balance
      customer_balance -= @transaction.amount
      # Change amount in table
      withdraw = @customer.update_attribute(:balance, customer_balance)

      # Add amount to cash box counter
      @cashbox = CompanyAccount.find(9)
      cashbox_balance = @cashbox.balance
      cashbox_balance -= @transaction.amount
      #Change amount in table
      reduce = @cashbox.update_attribute(:balance, cashbox_balance)

    else
      #All transactions
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
    end
    if charge && pay
      completed_transaction = @transaction.save
    end

    if deposit && receive
      completed_deposit = @transaction.save
    end

    if withdraw && reduce
      completed_withdrawal = @transaction.save
    end

    if completed_transaction
      flash[:success] = ""
      render 'new_contract'
    elsif completed_deposit
      flash[:success] = "deposit"
      render 'cbt'
    elsif completed_withdrawal
      flash[:success] = "withdrawal"
      render 'cbt'
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
