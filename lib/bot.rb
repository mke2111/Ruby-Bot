require_relative './set_up'
require 'net/http'
require 'json'
require 'dotenv'
Dotenv.load

class Karen
  include BotMethods

  def initialize
    @start = Time.now.to_i
    @info = info
  end

  def water
    while 1 == 1
      sleep 30
      @drink = true
      while @drink
        @current = Time.now.to_i
        puts "It is #{Time.now}, DRINK WATER" if @current - @start > 30
        @drink = false
      end
    end
  end

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

  def welcome
    "You should be with me more often, I make your life much healthier and better. It is #{Time.now}, take a glass of water to give you life NOW!"
  end

  def info
    "You finally decide to run me, I'll kill you with water"
  end

  def bye
    "It is #{Time.now}, take more water to keep you safe for me!"
  end

  def more
    @random_joke = {
      0 => 'The cool part about naming your kid is you don’t have to add six numbers to make sure the name is available',
      1 => 'I ate a clock yesterday, it was very time-consuming.',
      2 => 'Did you hear about the crook who stole a calendar? He got twelve months.',
      3 => 'Did you hear about the semi-colon that broke the law? He was given two consecutive sentences.',
      4 => 'I can still remember a time when the humanity knew more than a bot.'
    }

    @random_joke[rand(5)]
  end
end

class Motivation
  attr_reader :motivate

  def initialize
    @motivate = message_request
  end

  def select_randomly
    @motivate.sample
  end

  private

  def message_request
    url = 'https://programming-quotes-api.herokuapp.com/quotes/lang/en'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end
