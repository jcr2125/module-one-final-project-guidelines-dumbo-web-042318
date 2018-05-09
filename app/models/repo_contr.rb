class RepoContr < ActiveRecord::Base
  belongs_to :repository
  belongs_to :contributor, :class_name => "User"
end
