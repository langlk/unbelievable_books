class CartsController < ApplicationController
  def show
    @cart = current_cart
    @rainchecked = current_raincheck
  end
end
