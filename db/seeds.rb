require 'rest-client'
require 'JSON'
require 'pry'
User.destroy_all
Language.destroy_all
Repository.destroy_all
RepoContr.destroy_all

def get_token
  File.read(File.expand_path('github_token', File.dirname(__FILE__))).chomp
end

github = JSON.parse(RestClient.get('https://api.github.com/search/repositories?q=topic:oop', {Authorization: "token #{get_token}"}))
repos_array = github["items"]
repos_array.each do |repo|
  #create user
  owner = User.find_or_create_by(name: repo["owner"]["login"])
  #create language
  lang_name = repo["language"].downcase if repo["language"]
  language = Language.find_or_create_by(name: lang_name )
  #create repository with language and user objects
  repo_obj = Repository.create(name: repo["name"], description: repo["description"], forks: repo["forks"], watchers: repo["watchers"], owner: owner, language: language)
  #create contributor
  contributors = JSON.parse(RestClient.get(repo["contributors_url"], {Authorization: "token #{get_token}"}))
  contributors.each do |contributor|
    contributor_obj = User.find_or_create_by(name: contributor["login"])
    RepoContr.create(contributor: contributor_obj, repository: repo_obj)
  end

end

true
