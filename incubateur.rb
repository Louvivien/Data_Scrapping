require 'watir'
require 'pry'

browser = Watir::Browser.new(:firefox)
my_link = 'http://mon-incubateur.com/site_incubateur/incubateurs/1/#'
browser.goto my_link

sleep(2) #Give two seconds to load the page

my_incubator_hash = {}
my_incubator = []
incubator_links = []

#Ma boucle qui fait les 24 pages du site
k = 1

while k < 24

  array_data = browser.div(id:"incubators_list").spans

  for i in (0...array_data.count).step(2) do

    my_incubator << array_data[i].text

    incubator_links << array_data[i].a.href

  end

  k = k + 1

  #Save all the links in an array : incubator_links

  #Go to the next page
  u = k.to_s
  script_adress = "Element.show('network_navigate_search'); new Ajax.Request('/site_incubateur/incubateurs_inside/"+ u +"',
  {asynchronous:true, evalScripts:true, method:'get', onSuccess:function(request){Element.hide('network_navigate_search');},
  parameters:'text_search_filter=' + encodeURIComponent(document.getElementById('text_search_filter').value) + '&zip=' + '&page="+ u +"'}); return false;"

  browser.execute_script(script_adress)

  sleep(0.5)
end

  #Register the websites

  for i in 0...incubator_links.length


      browser.goto incubator_links[i]
      if browser.div(id:"content").div(class:"content-area").div(class:"info-block").ps[5].a.exists?

      incubator_website = browser.div(id:"content").div(class:"content-area").div(class:"info-block").ps[5].a.href
    else incubator_website = ""
    end

    my_incubator_hash[my_incubator[i]] = incubator_website
end
  puts my_incubator_hash
  browser.close
