require 'watir'
require 'pry'
browser = Watir::Browser.new
browser.goto 'http://mon-incubateur.com/site_incubateur/incubateurs'


submit_button = browser.button(type:"submit")
submit_button.click

binding.pry

require 'mechanize'

# Create a new instance of Mechanize and grab our page
agent = Mechanize.new
page = agent.get('http://robdodson.me/blog/archives/')

# Find all the links on the page that are contained within
# h1 tags.
post_links = page.links.find_all { |l| l.attributes.parent.name == 'h1' }

# Click on one of our post links and store the response
post = post_links[1].click
doc = page.parser # Same as Nokogiri::HTML(page.body)
p doc
