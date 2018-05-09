class Repository < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  # has_many :contributors, through: :repo_contrs, :class_name => "User"
  belongs_to :language
  # has_many :repo_contrs
end
