User stories
  #####"As a user I can find the most popular language for top Object Oriented repositories on Github"
  #####"As a user I want to know what type of projects are contained in repos"
  #####"As a user I want to find Object Oriented repos that match a search term"
  #####"As a user I want to find the most watched OO repositories"
  #####"As a user I want to find the OO repos with the largest community of contributors"
  #####"As a user I want to find the most forked OO repos"



Three things we learned:
Using an API to seed a database
Authentication for Github API because of limits
  Used a personal token from github placed in a file that is hidden by placing it's path in gitignore.  This allows us to not publish our personal authentication key on github when we push our code but it also makes it so that when someone downloads this code to use on another machine they have to input their own access key.


Features
  Refactor seed file
  change search query for github
  change search method to use regexp
  search titles as well
  Check for multiple pages of contributors
  Print out language as its meant to be printed
