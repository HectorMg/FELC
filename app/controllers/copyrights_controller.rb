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
  end

  def create
  end

  def edit
  end

  def destroy
  end
end
