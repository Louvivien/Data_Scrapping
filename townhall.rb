require 'nokogiri'
require 'open-uri'
require 'pry'

class Scrapping

  def get_the_email_of_a_townhal_from_its_webpage(url)
    @user_url = url
    page = Nokogiri::HTML(open(@user_url))

    mail_table = page.css("body > table > tbody > tr:nth-child(3) > td > table > tbody > tr:nth-child(1) > td:nth-child(1) > table:nth-child(8) > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(4)")
    name_table = page.xpath("//a[@class = 'lientxt4']")[1].text)
#my_hash[name_table] = mail_table
puts mail_table
binding.pry
end

end

#print "What is the website you want to scrap ?: "
#user_input = gets.chomp.to_s

user_input = "http://annuaire-des-mairies.com/95/vaureal.html"

scrapper = Scrapping.new

unless user_input.empty?

  scrapper.get_the_email_of_a_townhal_from_its_webpage(user_input)
  binding.pry
else
  puts "So you don't want to scrap. Bye"
end
