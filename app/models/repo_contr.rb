class RepoContr < ActiveRecord::Base
  belongs_to :repository
  belongs_to :contributor, :class_name => "User"


  def self.largest_community
    sql = "SELECT repositories.name, COUNT(contributor_id) FROM repo_contrs INNER JOIN repositories ON repositories.id = repo_contrs.repository_id GROUP BY repository_id ORDER BY COUNT(contributor_id) DESC LIMIT 1"
    ActiveRecord::Base.connection.execute(sql)[0]["name"]
  end

end
