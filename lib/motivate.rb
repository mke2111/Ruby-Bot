require 'net/http'
require 'json'
require 'dotenv'
Dotenv.load

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
    url = ENV['MOTIVATION']
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
