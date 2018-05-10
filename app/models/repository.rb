class Repository < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :contributors, through: :repo_contrs, :class_name => "User"
  belongs_to :language
  has_many :repo_contrs

  def self.most_popular_language
    sql = "SELECT languages.name, COUNT(language_id) FROM repositories INNER JOIN languages ON repositories.language_id = languages.id GROUP BY language_id ORDER BY COUNT(language_id) DESC LIMIT 1"
    ActiveRecord::Base.connection.execute(sql)[0]["name"]
  end

  def self.descriptions
    sql = "SELECT name, description FROM repositories"
    content = ActiveRecord::Base.connection.execute(sql)
    content.each do |repo|
      puts "Title: #{repo["name"]}"
      puts "Description: #{repo["description"]}"
      puts "**************"
    end
    puts "**********"
  end
  

end
