require_relative '../config/environment'
require 'pry'

new_cli = CLI.new
new_cli.greet
new_cli.menu
input = new_cli.get_input

loop do
  new_cli.menu_selection(input)
  new_cli.menu
  input = new_cli.get_input
  break if input == "exit"
end
