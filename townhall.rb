require 'nokogiri'
require 'open-uri'
require 'pry'

class Scrapping

  def get_the_email_of_a_townhal_from_its_webpage(array)
    my_hash = {}
    @url_array = array
    #Boucle sur chacun des liens obtenu sur le site des mairies du val d'oise
    @url_array.each { |link|
    page = Nokogiri::HTML(open(link))
    mail_table = page.xpath("//td[@class = 'style27']")[5].text
    name_table = page.xpath("//a[@class = 'lientxt4']")[1].text.capitalize
    #J'enleve tout les espaces pour mon mail
    @mail_table = mail_table.gsub(/\s+/, "")
    my_hash[name_table] = @mail_table[1..-1]
     }
    return my_hash
  end

def get_all_the_urls_of_val_doise_townhalls(url)
  @user_url = url
  table_link = []
  page = Nokogiri::HTML(open(@user_url))
  nom_ville = page.xpath("//a[@class = 'lientxt']")
  nom_ville.each { |link|
    townhall_url = "http://annuaire-des-mairies.com" + link["href"][1..-1]
    table_link << townhall_url
  }
    return table_link
  end

end

puts "==========================================================================================="
puts "This scrapping tool allows you to get the email for all the townhall in Val d'Oise (France)"
puts "==========================================================================================="
#print "What is the website you want to scrap ?: "
#user_input = gets.chomp.to_s

user_input = "http://annuaire-des-mairies.com/val-d-oise.html"

scrapper = Scrapping.new

unless user_input.empty?


 my_array = scrapper.get_all_the_urls_of_val_doise_townhalls(user_input)

 puts "Here you go"
 puts "==========================================================================================="
 puts my_data_hash = scrapper.get_the_email_of_a_townhal_from_its_webpage(my_array)
else
  puts "So you don't want to scrap. Bye"
end
