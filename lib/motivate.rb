require 'net/http'
require 'json'
require 'dotenv'
Dotenv.load('token.env')

class Motivation
  attr_reader :motivate

  def initialize
    @motivate = all_motivations
  end

  def random_motivation
    @motivate.sample
  end

  private

  def all_motivations
    url = 'https://programming-quotes-api.herokuapp.com/quotes/lang/en'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
