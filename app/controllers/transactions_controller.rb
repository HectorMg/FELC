class TransactionsController < ApplicationController

  def show
    @transaction = Transaction.find(params[:id])
    @customer = @transaction.customer
    @provider = @transaction.provider
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
    if @transaction.save
      render 'new_contract'
    else
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
