require 'rest-client'
require 'JSON'

github = JSON.parse(RestClient.get('https://api.github.com/search/repositories?q=topic:oop'))
repos_array = github["items"]
repos_array.each do |repo|
  user = User.create(name: repo["owner"]["login"])
  language = Language.create(name: repo["language"])
  Repository.create(name: repo["name"], description: repo["description"], forks: repo["forks"], watchers: repo["watchers"], owner: user, language: language)
end

true
