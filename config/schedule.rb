every 1.hour do

  set :output, "/Users/mathieu/Desktop/THP/D9_Scrapping/cron.log"
  command "ruby '/Users/mathieu/Desktop/THP/D9_Scrapping/crypto_price.rb'"

end

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
