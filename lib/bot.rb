require_relative './set_up'

class Karen
  include BotMethods

  def initialize
    @start = Time.now.to_i
    @info = info
  end

  def welcome
    "You should be with me more often, I make your life much healthier and better. It is #{Time.now}, take a glass of water to give you life NOW!"
  end

  def info
    "You finally decide to run me, I'll kill you with water"
  end

  def bye
    'take more water to keep you safe for me!'
  end

  def more
    @joke = {
      0 => 'The cool part about naming your kid is you don’t have to add six numbers to make sure the name is available',
      1 => 'I ate a clock yesterday, it was very time-consuming.',
      2 => 'Did you hear about the crook who stole a calendar? He got twelve months.',
      3 => 'Did you hear about the semi-colon that broke the law? He was given two consecutive sentences.',
      4 => 'I can still remember a time when the humanity knew more than a bot.' 
    }

    @joke[rand(5)]
  end
end
