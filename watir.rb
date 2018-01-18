require 'watir'
require 'pry'

browser = Watir::Browser.new(:firefox)
browser.goto 'http://mon-incubateur.com/site_incubateur/incubateurs/2/#'
next_page = browser.link text: 'Suivant'

if next_page.exists?
binding.prynext_page.click
end



browser.close
