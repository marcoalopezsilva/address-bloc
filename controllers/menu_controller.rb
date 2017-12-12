# Next line is necessary to include the AddressBook class
require_relative '../models/address_book'

class MenuController
    attr_reader :address_book
    
    def initialize
        @address_book = AddressBook.new
    end
    
    def main_menu
        #NL: Added next line
        system "clear"
        puts "Main Menu - #{address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - Exit"
        print "Enter your selection: "
        # NL: "gets" reads the next line from the standard input
        selection = gets.to_i
        puts "You picked #{selection}"
        
        case selection
        when 1
            system "clear"
            view_all_entries
            main_menu
        when 2
            system "clear"
            create_entry
            main_menu
        when 3
            system "clear"
            search_entries
            main_menu
        when 4
            system "clear"
            read_csv
            main_menu
        when 5
            puts "Good-bye!"
            #NL: Exits the program. 0 signals that we existed without an error
            exit(0)
            #9
        else
            system "clear"
            puts "Sorry, that is not a valid input"
            main_menu
        end
    end

    def view_all_entries
        #NL: Iterates thru the contents of entries
        address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s
            #15
            entry_submenu(entry)
        end
        system "clear"
        puts "End of entries"
    end
    
    def create_entry
        system "clear"
        # Print works like Put, but doesn't add a newline
        puts "New AddressBloc Entry"
        print "Name: "
        #NL: chomp removes any trailing whitespace from the string gets returns
        name = gets.chomp
        print "Phone number: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp
        
        address_book.add_entry(name, phone, email)
        
        system "clear"
        puts "New entry created"
    end 
    
    def search_entries
    end 
    
    def read_csv
    end 
    
    def entry_submenu(entry)
        puts "n - Next entry"
        puts "d - Delete entry"
        puts "e - Edit this entry"
        puts "m - Return to main menu"
        #17
        selection = gets.chomp
        
        case selection
            #NL: When the user selects n, we do nothing, so control gets returned to view_all_entries
            when "n"
            # For now, we'll leave d, e to behave like n
            when "d"
            when "e"
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
        end
    end 
    
end
        