class Repository < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :contributors, through: :repo_contrs, :class_name => "User"
  belongs_to :language
  has_many :repo_contrs

  def self.most_popular_language
    sql = "SELECT languages.name, COUNT(language_id) FROM repositories INNER JOIN languages ON repositories.language_id = languages.id GROUP BY language_id ORDER BY COUNT(language_id) DESC LIMIT 1"
    puts ActiveRecord::Base.connection.execute(sql)[0]["name"]
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

  def self.search_descriptions(term)
    sql = "SELECT name, description FROM repositories"
    content = ActiveRecord::Base.connection.execute(sql)
    content.select do |repo|
      repo["description"].downcase.include?(term.downcase)
    end.each do |repo|
      puts "Title: #{repo["name"]}"
      puts "Description: #{repo["description"]}"
      puts "**************"
    end
    puts "**********"
  end

  def self.most_watched
    puts Repository.order('watchers DESC').first.name
  end

  def self.most_forked
    puts Repository.order('forks DESC').first.name
  end

end
