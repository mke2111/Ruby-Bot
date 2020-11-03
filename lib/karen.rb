require 'net/http'
require 'json'
require 'dotenv'
Dotenv.load('token.env')

class Karen
  attr_accessor :random_joke

  def initialize
    @start = Time.now.to_i
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
    str = 'You should be with me more often, I make your life much healthier and better.'
    str << "It is #{Time.now}, take a glass of water to give you life NOW!"
  end

  def bye
    "It is #{Time.now}, take more water to keep you safe for me!"
  end

  def more
    @random_joke = {
      0 => 'The cool part about naming kids is you don’t have to add six numbers to make sure the name is available',
      1 => 'I ate a clock yesterday, it was very time-consuming.',
      2 => 'Did you hear about the crook who stole a calendar? He got twelve months.',
      3 => 'Did you hear about the semi-colon that broke the law? He was given two consecutive sentences.',
      4 => 'I can still remember a time when the humanity knew more than a bot.'
    }
    
    @random_joke[rand(5)]
  end
end
