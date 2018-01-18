require 'nokogiri'
require 'open-uri'
require 'pry'

class Scrapping

  def get_the_email_of_a_townhal_from_its_webpage(url)
    my_hash = {}
    @user_url = url
    page = Nokogiri::HTML(open(@user_url))
    mail_table = page.xpath("//td[@class = 'style27']")[5].text
    name_table = page.xpath("//a[@class = 'lientxt4']")[1].text.capitalize
    #J'enleve tout les espaces pour mon mail
    @mail_table = mail_table.gsub(/\s+/, "")
    my_hash[name_table] = @mail_table[1..-1]
    return my_hash
  end

def get_all_the_urls_of_val_doise_townhalls(url)
  @url = url

end

end


puts "This scrapping tool allows you to get the email for all the townhall in Val d'Oise (France)"
#print "What is the website you want to scrap ?: "
#user_input = gets.chomp.to_s

user_input = "http://annuaire-des-mairies.com/95/vaureal.html"

scrapper = Scrapping.new

unless user_input.empty?

  puts scrapper.get_the_email_of_a_townhal_from_its_webpage(user_input)

else
  puts "So you don't want to scrap. Bye"
end
