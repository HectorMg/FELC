class PropertiesController < ApplicationController
  def show
    @property = Property.find(params[:id])
  end

  def new
  end

  def create
  end

  def delete
  end

  def edit
  end
end
