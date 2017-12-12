require_relative 'controllers/menu_controller'

#NL: Creates a new MenuController when the program starts
menu = MenuController.new
#NL: Clears the command line
system "clear"
puts "Welcome to AddressBloc!"
puts
#NL: Executes (calls) main_menu to display the menu
menu.main_menu
