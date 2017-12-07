class TaxRate
  def self.get_tax_rate
    response = RestClient::Request.execute(
      method: :get,
      url: 'https://sandbox-rest.avatax.com/api/v2/taxrates/bypostalcode?country=US&postalCode=98105',
      headers: { Authorization: ENV['AVATAX_KEY'] }
    )
    return JSON.parse(response)['totalRate']
  end
end
