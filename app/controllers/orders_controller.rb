class OrdersController < ApplicationController
  def index
    @orders = current_user.account.orders.placed
  end
end
