require 'rest-client'
require 'JSON'

github = JSON.parse(RestClient.get('https://api.github.com/search/repositories?q=topic:oop'))
repos_array = github["items"]
repos_array.each do |repo|
  #create user
  user = User.create(name: repo["owner"]["login"])
  #create language
  language = Language.create(name: repo["language"])
  #create repository with language and user objects
  repo_obj = Repository.create(name: repo["name"], description: repo["description"], forks: repo["forks"], watchers: repo["watchers"], owner: user, language: language)
  #create contributor

end

# repo_special = repo.map {|key, value|}
true



# contributors = JSON.parse(RestClient.get(repo["contributors_url"]))
# contributors.each do |contributor|
#   user_exist = User.find_by(name: contributor["login"])
#   if user_exist
#     RepoContr.new(contributor: user_exist, repository: repo_obj)
#   else
#     cont = User.new(name: contributor["login"])
#     RepoContr.new(contributor: cont, repository: repo_obj)
#   end
# end
