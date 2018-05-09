class User < ActiveRecord::Base
  #as owner
  has_many :repositories, :foreign_key => 'owner_id'
  has_many :languages, through: :repositories
  #as contributor
  # has_many :repo_contrs, :foreign_key => 'contributor_id'
  # has_many :repositories, through: :repo_contrs
end
