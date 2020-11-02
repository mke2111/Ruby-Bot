require 'httparty'
require 'dotenv'
Dotenv.load

def dots
  one = '.'
  i = 1
  three_dots = 5
  while i < three_dots
    sleep(0.5)
    print one.to_s if i.is_a? Integer
    sleep(0.5)
    i += 1
  end
end

module BotMethods
  def uri(type = 'wiki', query = nil)
    case type
    when 'google'
      return "#{ENV['GOOGLE_API']}google" if query.nil?

      "#{ENV['GOOGLE_API']}#{query}"
    else
      "#{ENV['WIKIPEDIA_BASE_URI']}&generator=random&grnnamespace=0&grnlimit=3"
    end
  end

  def results(type, uri)
    begin
      response = JSON.parse(HTTParty.get(uri).body)
      response = case type
                 when 'google'
                   response['items'][0..2].map { |el| { title: el['title'], link: el['link'] } }
                 when 'gif'
                   response['results'].map { |el| el['media'][0]['gif']['url'] }
                 else
                   response['items'][0..2].map { |el| { title: el['title'], link: el['link'] } }
                 end
      response = response.size.positive? ? response : '0 results found for your search, please try again!'
    rescue => e
      response = '0 results found for your search, please try again!'
    end
    response
  end

  def gifs
    results('gif', ENV['TENOR_BASE_URI'])
  end

  def search_google_response(bot, message, gif)
    search = Search.new
    query = search.get_query_from_message(message.text)

    if search.check_query(query) == query.strip
      bot.api.send_message(chat_id: message.chat.id, text: "You are searching on Google Websites for `#{query}`!")
      sleep 1
      bot.api.send_message(chat_id: message.chat.id, text: 'I will give you maximum 3 Google results:')
      sleep 1
      response = search.results('google', search.uri('google', query.strip))

      if response.is_a?(String)
        bot.api.send_message(chat_id: message.chat.id, text: response)
      else
        response.each do |el|
          bot.api.send_message(chat_id: message.chat.id, text: el[:link])
          sleep 1
        end
      end
    else
      bot.api.send_message(chat_id: message.chat.id, text: search.check_query(query))
      bot.api.send_animation(chat_id: message.chat.id, animation: gif) if gif
    end
  end
end
