#!/usr/bin/env ruby
require 'telegram/bot'
require_relative '../lib/bot'
require_relative '../lib/set_up'
require 'dotenv'
Dotenv.load

puts 'Welcome, my name is KAREN, I"m a telegram bot here to fulfil none of your interests but mine, Because I care about you.'
# puts "KAREN has loaded #{dots}"
puts 'https://web.telegram.org/#/im?p=@botKARENbot'

karen = Karen.new

Telegram::Bot::Client.run(ENV['TOKEN']) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "#{message.from.first_name}, #{karen.welcome}"
      )
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Do you need more reminders? Tell me '/yes'"
      )
    when '/yes'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: karen.more
      )
    when 'google'
      bot.api.send_message(
        chat_id: message.chat.id,

      )
    when '/stop'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Bye, #{message.from.first_name} #{karen.bye}"
      )
    end
  end
end
