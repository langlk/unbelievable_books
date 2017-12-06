class CartsController < ApplicationController
  def show
    @cart = current_cart
    @rainchecked = current_raincheck
    @quotes = Currency.get_exchange_rates
  end
end
