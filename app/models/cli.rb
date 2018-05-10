class CLI
  def greet
    puts "Welcome TOO OOP Srchr! Get the latest information on GitHubs top OOP repositories."
  end

  def menu
    puts "Please enter the number of the menu option that you'd like to select."
    puts "1. Most popular language for OOP repositories."
    puts "2. All repository descriptions."
    puts "3. Search repositories by keyword or phrase."
    puts "4. Find the most watched repository."
    puts "5. Repository with the largest community of contributors."
    puts "6. Repository with the most forks."
    puts "Type 'exit' to quit."
  end

  def get_input
    gets.chomp
  end

  def menu_selection(num)
    int = num.to_i
    case int
    when 1
      Repository.most_popular_language
    when 2
      Repository.descriptions
    when 3
      self.ask_for_search_term
    when 4
      Repository.most_watched
    when 5
      RepoContr.largest_community
    when 6
      Repository.most_forked
    else
      puts "That is not a valid menu selection."
    end
  end

  def ask_for_search_term
    puts "What would you like to search for?"
    term = gets.chomp
    Repository.search_descriptions(term)
  end

end
