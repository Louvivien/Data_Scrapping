require 'nokogiri'
require 'open-uri'
require 'pry'

class Scrapping

  def get_the_email_of_a_townhal_from_its_webpage(url)
    @user_url = url
    page = Nokogiri::HTML(open(@user_url))
  end

end

#print "What is the website you want to scrap ?: "
#user_input = gets.chomp.to_s

user_input = "http://annuaire-des-mairies.com/95/vaureal.html"

scrapper = Scrapping.new

unless user_input.is_empty?

  scrapper.get_the_email_of_a_townhal_from_its_webpage(user_input)

else
  puts "So you don't want to scrap. Bye"
end
