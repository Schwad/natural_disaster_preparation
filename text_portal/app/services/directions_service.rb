class DirectionsService
  attr_reader :query

  def initialize(query)
    @query = query.split(",")[1..-1]
  end

  def call
    if @query.length < 2 || @query.length > 2
      "We are sorry, but you did not two locations for your command! \n\nTry -directions, location_a, location_b-. Be sure to *not* include commas in your locations (i.e. 'lostiwithiel cornwall uk')"
    else
      current_directions
    end
  end

  private

  def current_directions
    response = Faraday.get "https://maps.googleapis.com/maps/api/directions/json?origin=#{@query[0].strip.gsub(' ', '+').gsub(',', '+')}&destination=#{@query[1].strip.gsub(' ', '+').gsub(',', '+')}&key=#{Rails.application.credentials[:google_maps_api_key]}"
    legs = JSON.parse(response.body)["routes"][0]["legs"][0]["steps"].map{|x| [x['html_instructions'], x['distance']['text']] }.map{|x| "#{ActionView::Base.full_sanitizer.sanitize(x[0])} for #{x[1]}" }.join("\n\n-----\n\n")

    ["Your directions for #{@query[0].strip} to #{@query[1].strip} are:", legs].join("\n\n---\n\n")
  end
end
