require 'rest-client'
require 'JSON'
require 'pry'

github = JSON.parse(RestClient.get('https://api.github.com/search/repositories?q=topic:oop'))

binding.pry

true
