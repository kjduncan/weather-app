require 'yahoo_weatherman’
puts 'what is your location?'
location = gets.chomp
puts 'weather for [location]'

require 'yahoo_weatherman'

def get_location(location)
  client = Weatherman::Client.new:unit=>"F"
  client.lookup_by_location(location)
  end

forecast = get_location(location).forecasts

today= Time.now.strftime('%w').to_i
tomorrow = today + 1

forecast.each do |forecasts|
     if forecasts.fetch('date').strftime('%w').to_i == today
        puts "Today" +  " is going to be " + forecasts.fetch('text').downcase + " with a low of " + forecasts.fetch('low').to_s + 'F' + " and a high of " + forecasts.fetch('high').to_s + 'F'

    elsif forecasts.fetch('date').strftime('%w').to_i == tomorrow
        puts "Tomorrow" +  " is going to be " + forecasts.fetch('text').downcase + " with a low of " + forecasts.fetch('low').to_s + 'F' + " and a high of " + forecasts.fetch('high').to_s + 'F'
    else
        puts forecasts.fetch('day').to_s +  ' is going to be ' + forecasts.fetch('text').downcase + ' with a low of ' + forecasts.fetch('low').to_s + 'F' +' and a high of ' + forecasts.fetch('high').to_s + 'F'
    end
end
