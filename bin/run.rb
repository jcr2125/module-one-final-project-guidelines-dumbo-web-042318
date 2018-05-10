require_relative 'config/environment'

new_cli = CLI.new
new_cli.greet
new_cli.menu
input = new_cli.get_input

do while input != "exit"
  new_cli.menu_selection(input)
  new_cli.menu
  input = new_cli.get_input
end
