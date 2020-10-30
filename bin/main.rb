require 'telegram/bot'
require_relative '../config.rb'
require_relative '../lib/set_up.rb'

puts 'Welcome, my name is KAREN, I"m a telegram bot here to fulfil none of your interests but mine!'
# puts "KAREN has loaded #{dots}"

token = '1364171657:AAGcnycM0YLgWn1s2hsCkm-yfWw1g7-EOp4'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
