# Next line tells Ruby to load the library called entry.rb (expected to be at the same path, because it's relative)
require_relative 'entry'
require "csv"
    
class AddressBook
    
    attr_accessor :entries
    
    def initialize
        @entries = []
    end

    def add_entry(name, phone_number, email)
        # index will store the insertion index
        index = 0
        entries.each do |entry|
            #Next we find the appropriate point to insert the new entry (lexicographic order: abc < bcd)
            if name < entry.name
                break
            end 
            index+= 1
        end 
        #11
        entries.insert(index, Entry.new(name, phone_number, email))
    end
    
    def remove_entry(name, phone_number, email)
        index = 0
        entries.each do |entry|
            if name < entry.name
                break
            end
            index+= 1
        end
        entries.delete_at(index)
    end 

    def import_from_csv(file_name)
        #NL: Reads file_name and stores content in variable csv_text
        csv_text = File.read(file_name)
        #NL: Uses the CSV class and its parse method to parse the content. The result of CSV.parse is an object of the type CSV::table
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
        csv.each do |row|
            row_hash = row.to_hash
            #NL: because row_hash is a hash (dictionary) we refer to its contents by the key (e.g. "name")
            add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end
        
    end
    
end