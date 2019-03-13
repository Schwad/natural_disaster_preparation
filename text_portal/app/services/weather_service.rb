class WeatherService
  attr_reader :query

  def initialize(query)
    @query = query.split(",")[1..-1].join(",")
  end

  def call
    if @query
      current_weather_forecast
    else
      "We are sorry, but you did not supply a query with your weather command! \n\nTry -weather, my_postcode-"
    end
  end

  private

  def current_weather_forecast
    key = location_key
    if !key[:status]
      "This location does not exist, or there was a failure. Sorry! Please try again"
    else
      process_for_text(key[:key])
    end
  end

  def location_key
    response = Faraday.get "http://dataservice.accuweather.com/locations/v1/search?apikey=#{Rails.application.credentials[:accuweather_api_key]}&q=#{@query}"
    { status: response.success?, key: JSON.parse(response.body)[0]["Key"] }
  end

  def process_for_text(key)
    response = Faraday.get "http://dataservice.accuweather.com/forecasts/v1/daily/5day/#{key}?apikey=#{Rails.application.credentials[:accuweather_api_key]}"
    if response.success?
      daily_forecasts = []
      iterator = 1
      JSON.parse(response.body)["DailyForecasts"].each do |forecast|
        daily_forecasts << "The forecast in #{iterator} day is:\n\nLow:#{to_celsius(forecast["Temperature"]["Minimum"]["Value"])}C\nHigh:#{to_celsius(forecast["Temperature"]["Maximum"]["Value"])}C\nDay:#{forecast["Day"]["IconPhrase"]}\nNight:#{forecast["Night"]["IconPhrase"]}\n\n"
        iterator +=1
      end
      daily_forecasts.join("-----\n\n")
    else
      "We are sorry, but our API had a problem getting this request"
    end
  end

  def to_celsius(value)
    ((value.to_f - 32)*0.5556).round(2)
  end
end
