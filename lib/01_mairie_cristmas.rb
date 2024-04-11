require 'nokogiri'
require 'open-uri'


def get_townhall_emails
  doc = Nokogiri::HTML5(URI.open("https://www.aude.fr/annuaire-mairies-du-departement"))

  townhall_page = doc.xpath('//div[contains(@class, "directory-block")]')

  townhall_list = {}

  townhall_page.each do |block|
    city = block.xpath('.//h2').text
    email = block.xpath('.//p[3]/a').text
    townhall_list[city] = email unless email.empty?
  end

  return townhall_list
end



