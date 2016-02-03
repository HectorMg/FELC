class LandingPageController < ApplicationController
  before_action :logged_in_user, only: :landing

  def landing
  end

  #Before action filters
  def logged_in_user
    if logged_in?
      redirect_to home_path
    end
  end

end
