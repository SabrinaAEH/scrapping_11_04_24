require 'nokogiri'
require 'open-uri'

def crypto_function
  doc = Nokogiri::HTML5(URI.open("https://coinmarketcap.com/all/views/all/"))

  crypto_page = doc.xpath('//tr[contains(@class, "cmc-table-row")]') 

  crypto_prices = {}

  crypto_page.each do |row|
    name = row.xpath('.//td[2]').text
    currency = row.xpath('.//td[5]').text
    crypto_prices[name] = currency unless currency.empty?
  end

  return crypto_prices
end

