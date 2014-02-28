# post_message.rb
require "net/http"

puts ""
print "Who do you want to message? "
to = gets.chomp

print "Who are you? "
from = gets.chomp

print "Your message: "
content = gets.chomp

puts ""
print "Sending message..."

uri = URI("http://localhost:9292")

# TODO: Post the message to the server
# How do you submit a POST request using Ruby?
# Maybe a library called Net::HTTP has a post method? Google.

response = Net::HTTP.post_form(uri, {"from" => from, "content" => content})


if response.body == "success"
  puts "done!"
else
  puts "Oops, something went wrong :("
end

puts ""
