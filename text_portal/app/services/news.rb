class News
  attr_reader :type, :message, :query

  def initialize(type, query=nil)
    @type = type
    @query = query
  end

  def call
    case type
    when 'british'
      british_headlines
    when 'query'
      queried_headlines
    end
  end

  private

  def british_headlines
    process_for_text(Faraday.get "https://newsapi.org/v2/top-headlines?country=gb&apiKey=#{Rails.application.credentials.news_api_key}")
  end

  def queried_headlines
    process_for_text(Faraday.get "https://newsapi.org/v2/everything?q=#{@query}&apiKey=#{Rails.application.credentials.news_api_key}")
  end

  def process_for_text(response)
    JSON.parse(response.body)["articles"].sample(5).map{|x| "#{x['title']}\n\n#{x['source']['name']}\n\n#{x['description']}" }
  end
end
