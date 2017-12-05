class AccountsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @accounts = Account.all
  end

  def update
    @account = Account.find(params[:id])
    if @account.preferred
      @account.preferred = false
    else
      @account.preferred = true
    end
    if @account.save
      flash[:notice] = "Account successfully updated!"
    else
      flash[:alert] = @account.errors.full_messages
    end
    redirect_to accounts_path
  end
end
