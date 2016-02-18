class CopyrightsController < ApplicationController
  def index
    @copyrights = Copyright.all
  end

  def show
    @copy = Copyright.find(params[:id])
    render :layout => "contract_layout"
  end

  def new
    @copy = Copyright.new
    @copy.created_at = Time.now
    @transaction = Transaction.new
    @transaction.created_at = Time.now
  end

  def create
    @copy = Copyright.new(copyright_params)

    @copy.active = false
    @copy.amount = 40.0
    @copy.deactivated = false

    @company = @copy.company_account

    balance = @company.balance

    if balance >= @copy.amount
      balance -= @copy.amount

      charge = @company.update_attribute(:balance, balance)

      @transaction = Transaction.new()

      # description
      @transaction.description = "Copyright registration for: #{@copy.concept}"
      limit_time = Time.now.advance(hours: 1)
      @transaction.customer_role = "Bring proof of copyright by #{limit_time}"
      @transaction.customer_consequence = "Copyright will not be activated and there will be no refund"
      @transaction.amount = 40.0
      @transaction.provider_id = 9
      @transaction.customer_id = @company.id
    end

    if charge
      @copy.save
      @transaction.save
      redirect_to :action => "index"
    else
      flash[:error] = ""
      redirect_to :action => "new"
    end

  end

  def activate
    @copyright = Copyright.find(params[:copyright][:id])
    if @copyright.update_attribute(:active, true)
      redirect_to :action => "index"
      @copyrights = Copyright.all
    end
  end

  def retire
    @copyright = Copyright.find(params[:copyright][:id])
    if @copyright.update_attribute(:deactivated, true) && @copyright.update_attribute(:active, false)
      redirect_to :action => "index"
      @copyrights = Copyright.all
    end
  end

  def retire_all
    @copyrights = Copyright.all

    @copyrights.each do |c|
      if c.active
        c.update_attributes(:active => false, :deactivated => true)
      end
    end
    redirect_to :action => "index"
  end

  def edit
  end

  def destroy
  end

  private

    def copyright_params
      params.require(:copyright).permit(:company_account_id, :concept)
    end
end
