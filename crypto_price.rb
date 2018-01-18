start = Time.now
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scrapping

  def gets_the_data(url)

    @url = url
    page = Nokogiri::HTML(open(@url))
    my_hash = {}
    my_loop_number = (page.xpath("//table[@id = 'currencies-all']/tbody").children.count - 1) / 2

    my_array_name = page.css("table#currencies-all tbody tr td.no-wrap.currency-name a.currency-name-container")
    my_array_price = page.css("table#currencies-all tbody tr td.no-wrap.text-right a.price")

    for i in 0...my_loop_number
      my_hash[my_array_name[i].text]=my_array_price[i].text
    end

    return my_hash

  end

end

puts "This scrapper will scrapp coinmarket.com"

scrapper = Scrapping.new
coin_link = "https://coinmarketcap.com/all/views/all/"
puts scrapper.gets_the_data(coin_link)


#Calcul du temps de scrapping
finish = Time.now
diff = finish - start

puts "This scrapping was executed in #{diff}seconds"
