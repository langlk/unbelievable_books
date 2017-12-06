class CartsController < ApplicationController
  def show
    @cart = current_cart
    @rainchecked = current_raincheck
    @quotes = JSON.parse(Currency.get_exchange_rates)['quotes']
  end
end
