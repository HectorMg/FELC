class TransactionsController < ApplicationController

  before_action :admin_user, only: [:new_contract, :new_copyright,
                                    :stock_purchase, :stock_sale,
                                    :properties, :cbt, :create]
  before_action :own_transaction, only: :show


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

  def new_property_purchase
    @transaction = Transaction.new
    @properties = Property.all
  end

  def stock_purchase
    @transaction = Transaction.new
    @user = current_user
  end

  def stock_sale
  end

  def cbt
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.created_at = Time.now
    # For deposits only (move to helper)
    if transaction_params[:description] == "Deposit"
      type = "Deposit"
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
      type = "Withdrawal"
      # Add amount to company account
      @customer = CompanyAccount.find(@transaction.customer_id)
      customer_balance = @customer.balance

      if(@customer.balance >= @transaction.amount)
        customer_balance -= @transaction.amount
        # Change amount in table
        withdraw = @customer.update_attribute(:balance, customer_balance)

        # Add amount to cash box counter
        @cashbox = CompanyAccount.find(9)
        cashbox_balance = @cashbox.balance
        cashbox_balance -= @transaction.amount
        #Change amount in table
        reduce = @cashbox.update_attribute(:balance, cashbox_balance)
      end

      # Property sale
    elsif transaction_params[:description] == "Property"
      type = "Property"
      #Get property:
      @property = Property.find(transaction_params[:provider_role].to_i)

      #Get buyer
      @customer = CompanyAccount.find(transaction_params[:customer_id])
      #Get seller
      @provider = CompanyAccount.find(transaction_params[:provider_id])

      #TRANSACTION PHASE
      @transaction = Transaction.new(transaction_params)

      if(@customer.balance >= @transaction.amount && @provider.id == @property.company_account.id)

        # Change description
        @transaction.description = "#{@customer.name} purchases the #{@property.name} Property from #{@provider.name} for #{@transaction.amount}"

        @transaction.customer_role = "Pay the established amount."
        @transaction.provider_role = "Relinquish said property."
        @transaction.valid_through = "This purchase is valid for the rest of the event or until a different contract is established"

        # Charge
        new_c_balance = @customer.balance - @transaction.amount
        charge_for_property = @customer.update_attribute(:balance, new_c_balance)

        # Pay
        new_p_balance = @provider.balance + @transaction.amount
        pay_for_property = @provider.update_attribute(:balance, new_p_balance)

        # Property Exchange
        @property.bought_at = @transaction.amount
        @property.company_account = @customer
        exchange_property = @property.save
      end
    else
      #Inter Company transactions
      #Remove amount from customer
      type = "ICT"
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
    if charge_for_property && pay_for_property && exchange_property
      completed_property_sale = @transaction.save
    end

    if type == "ICT"
      if completed_transaction
        flash[:success] = ""
        render 'new_contract'
      else
        flash[:error] = ""
        render 'new_contract'
      end
    elsif type == "Deposit"
      if completed_deposit
        flash[:success] = "deposit"
        render 'cbt'
      else
        flash[:error] = ""
        render 'new_contract'
      end
    elsif type == "Withdrawal"
      if completed_withdrawal
        flash[:success] = "withdrawal"
        render 'cbt'
      else
        flash[:error] =""
        render 'cbt'
      end
    elsif type == "Property"
      if completed_property_sale
        flash[:success] = ""
        render 'new_property_purchase'
      else
        flash[:error] = ""
        render 'new_property_purchase'
      end
    end
  end

  # Before action filters

  def admin_user
    redirect_to(company_bank_url) unless current_user.admin?
  end

  def own_transaction
    @transaction = Transaction.find(params[:id])
    if !belongs_to_user_company(@transaction) && !current_user.admin?
      redirect_to(company_bank_url)
    end
  end

  private

    def transaction_params
      params.require(:transaction).permit(:description, :provider_id, :customer_id,
                                          :provider_role, :customer_role, :provider_consequence,
                                          :customer_consequence, :valid_through, :amount, :stock)
    end
end
