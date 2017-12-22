# Next line is necessary to include the AddressBook class
require_relative '../models/address_book'

class MenuController
    attr_reader :address_book
    
    def initialize
        @address_book = AddressBook.new
    end
    
    def main_menu
        puts "Main Menu - #{address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - View a specific entry, by number"
        puts "6 - Blow up the address book"
        puts "7 - Exit"
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
            if address_book.entries.length > 0
                system "clear"
                view_specific_entry
                main_menu
            else
                system "clear"
                puts "Address book is empty, select another option"
                puts
                main_menu
            end
        when 6
            system "clear"
            address_book.nuke
            puts "The address book was emptied"
            puts
            main_menu
        when 7
            puts "Good-bye!"
            #NL: Exits the program. 0 signals that we existed without an error
            exit(0)
        else
            system "clear"
            puts "Sorry, that is not a valid input"
            puts
            main_menu
        end
    end

    def view_specific_entry
        print "Enter the Entry number you want to view: "
        select = gets.to_i
        if select < address_book.entries.length
            puts "Entry number #{select} ~> "
            puts address_book.entries[select].to_s
            puts
        else
            puts "Invalid entry number! There are #{address_book.entries.length} entries, with index numbers starting at 0. Please try again"
            view_specific_entry
        end
    end 
    
    def view_all_entries
        #NL: Iterates thru the contents of entries
        address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s
            puts
            entry_submenu(entry)
        end
        system "clear"
        puts "End of entries"
        puts
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
        puts
    end 
    
    def search_entries
        print "Search by name: "
        name = gets.chomp
        match = address_book.binary_search(name)
        system "clear"
        if match
            puts match.to_s
            search_submenu(match)
        else 
            puts "No match found for #{name}"
        end
    end 
    
    def read_csv
        
        print "Enter CSV file to import: "
        file_name = gets.chomp
        
        if file_name.empty?
            system "clear"
            puts "No CSV file read"
            main_menu
        end
    
        begin
            entry_count = address_book.import_from_csv(file_name).count
            system "clear"
            puts "#{entry_count} new entries added from #{file_name}"
        rescue
            puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"    
            read_csv
        end
    
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
            when "d"
                delete_entry(entry)
            when "e"
                edit_entry(entry)
                entry_submenu(entry)
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
        end
    end 
    
    def search_submenu(entry)
        puts "\nd - Delete entry"
        puts "e - Edit this entry"
        puts "m - Return to main menu"
        selection = gets.chomp
        case selection
            when "d"
                system "clear"
                delete_entry(entry)
                main_menu
            when "e"
                edit_entry(entry)
                system "clear"
                main_menu
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                puts entry.to_s
                search_submenu(entry)
        end
    end
    
    
    def delete_entry(entry)
        address_book.entries.delete(entry)
        puts "#{entry.name} has been deleted"
    end 
    
    def edit_entry(entry)
        print "Updated name: "
        name = gets.chomp
        print "Updated phone number: "
        phone_number = gets.chomp
        print "Updated email: "
        email = gets.chomp
        entry.name = name if !name.empty?
        entry.phone_number = phone_number if !phone_number.empty?
        entry.email = email if !email.empty?
        system "clear"
        puts "Updated entry: "
        puts entry
    end

end
        