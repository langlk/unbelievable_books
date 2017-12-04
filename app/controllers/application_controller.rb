class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_cart, :current_raincheck

  def authenticate_admin!
    unless current_user && current_user.admin?
      flash[:alert] = "You aren't authorized to do that."
      redirect_to '/'
    end
  end

  def current_cart
    if current_user
      current_user.account.cart
    end
  end

  def current_raincheck
    if current_user
      current_user.account.raincheck
    end
  end
end
