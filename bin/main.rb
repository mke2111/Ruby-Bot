#!/usr/bin/env ruby
require 'telegram/bot'
# require_relative '../bin/config'
require_relative '../lib/bot'
require_relative '../lib/set_up'

puts 'Welcome, my name is KAREN, I"m a telegram bot here to fulfil none of your interests but mine!'
# puts "KAREN has loaded #{dots}"
puts 'https://web.telegram.org/resolve?domain=botKARENbot#/im?p=@botKARENbot'

karen = Karen.new

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hi #{message.from.first_name}, #{karen.welcome}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
