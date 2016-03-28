require 'json'
require 'ostruct'
require 'yaml'
require 'date'

API_URL = "http://api.openweathermap.org/data/2.5"

class Weather
  def self.for(city)
    raw_data = Faraday.get("#{API_URL}/forecast?q=#{city},us&units=imperial&APPID=#{ENV['OPENWEATHERMAP_KEY']}").body
    weather_data = JSON.parse(raw_data, object_class: OpenStruct)
    weather_data.list.map do |data|
      Forecast.new(data)
    end
  end
end