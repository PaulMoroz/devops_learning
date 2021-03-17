#!/usr/bin/env ruby
require 'sinatra'
require 'json'
require 'sqlite3'

configure do
  enable :cross_origin
end

before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end

options "*" do
  response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end



post "/users" do
  data = JSON.parse request.body.read
  puts data
  200
end

get "/users/:user_email" do
  200
end