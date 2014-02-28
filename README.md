---
tags: sinatra, activerecord, post
language: ruby
---

# Sinatra Messages

lookup sinatra reloader

1. The post_message.rb must submit a POST request to localhost:9292
(this running sinatra application). It should post
to, from, content variables along with the request.
Lookup how to submit POST requests using net/http
and how to submit data along with that request

2. Build out the post '/' routes below in this file
to take the incoming data and create a message from it
you will need to lookup some basics on datamapper
the getting started guide is a good place to start
and you will need to lookup how to get POST
data out of the request in sinatra

3. You need to edit messages.erb to iterate
through all the @messages and print out the
data