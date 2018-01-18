#! /usr/bin/env ruby

require 'nokogiri'
#For website
require 'open-uri'

require 'pry'

# Fetch and parse HTML document

a = 'https://www.nytimes.com'
doc = Nokogiri::HTML(open(a))
doc.xpath('//h3/a').each do |node|
    puts node.text
    binding.pry
  end
#=>   http://reddit.com
#=>   http://www.nytimes.com

puts news_links.class



puts "### Search for nodes by css"
doc.css('nav ul.menu li a', 'article h2').each do |link|
  puts link.content
end

puts "### Search for nodes by xpath"
doc.xpath('//nav//ul//li/a', '//article//h2').each do |link|
  puts link.content
end

puts "### Or mix and match."
doc.search('nav ul.menu li a', '//article//h2').each do |link|
  puts link.content
end
