require 'Nokogiri'
require 'open-uri'
require 'pry'
require 'mechanize'

agent = Mechanize.new
page = agent.get('http://mon-incubateur.com/site_incubateur/incubateurs/1/#')

my_hash = {}

#Ma boucle qui fait les 24 pages du site
k = 1
while k < 24

  incubator_name = page.css("div#incubators_list table p a:nth-of-type(1)")
  length = incubator_name.length - 2

#Je soustrait -2 pour éviter que ca bug

  i = 0
  (0...length).step(2) do |i|

    a = incubator_name[i+1].text
    b = incubator_name[i+2].text

    my_hash[a] = b

  end

puts my_hash

post_links = page.links.find_all { |l|
 unless l.text == "Suivant >"
 else
  page = k + 1
  url = "http://mon-incubateur.com/site_incubateur/incubateurs/#{page}/#"
    binding.pry
    agent.get(url)
    abort
  end
}
k = k + 1
end




# Click on one of our post links and store the response
post = post_links[1].click
doc = page.parser # Same as Nokogiri::HTML(page.body)
p doc
