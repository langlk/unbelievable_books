class Currency
  def self.get_exchange_rate
    response = RestClient::Request.execute(method: :get, url: "http://apilayer.net/api/live?access_key=#{ENV["CURRENCYLAYERKEY"]}&currencies=AUD,EUR,GBP,PLN")

  end
end
