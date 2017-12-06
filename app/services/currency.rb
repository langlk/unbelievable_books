class Currency
  def self.get_exchange_rates
    response = RestClient::Request.execute(method: :get, url: "http://apilayer.net/api/live?access_key=#{ENV["CURRENCYLAYERKEY"]}&currencies=CAD,EUR,GBP,PLN")
    return JSON.parse(response)['quotes']
  end
end
