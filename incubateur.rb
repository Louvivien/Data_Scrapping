require 'watir'
require 'pry'

browser = Watir::Browser.new(:firefox)
my_link = 'http://mon-incubateur.com/site_incubateur/incubateurs/1/#'
browser.goto my_link

sleep(2) #Give two seconds to load the page

my_incubator = []

#Ma boucle qui fait les 24 pages du site
k = 1
while k < 24
a = browser.div(id:"incubators_list").spans
a.each do |x|
  my_incubator << x.text
end




k = k + 1
u = k.to_s
script_adress = "Element.show('network_navigate_search'); new Ajax.Request('/site_incubateur/incubateurs_inside/"+ u +"',
{asynchronous:true, evalScripts:true, method:'get', onSuccess:function(request){Element.hide('network_navigate_search');},
parameters:'text_search_filter=' + encodeURIComponent(document.getElementById('text_search_filter').value) + '&zip=' + '&page="+ u +"'}); return false;"

browser.execute_script(script_adress)


end

puts my_incubator
browser.close
