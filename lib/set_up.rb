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


module Bot_methods
  def uri(type = 'wiki', query = nil)
    case type
    # when 'wiki'
    #   return "#{ENV['WIKIPEDIA_BASE_URI']}&generator=random&grnnamespace=0&grnlimit=3" if query.nil?

    #   "#{ENV['WIKIPEDIA_BASE_URI']}&list=search&utf8=1&origin=*&srlimit=3&srsearch=#{query}"
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
                #  when 'wiki-search'
                #    response['query']['search'].map { |el| { title: el['title'] } }
                #  when 'wiki-random'
                #    response['query']['pages'].map { |el| { title: el[1]['title'] } }
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
  en

  def gifs
    results('gif', ENV['TENOR_BASE_URI'])
  end
end

