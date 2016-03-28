class Application < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/weather' do
    if params[:city]
      @forecasts = Weather.for(params[:city])
    end
    erb :weather
  end
end