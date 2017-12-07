# Next line tells Ruby to load the library called entry.rb (expected to be at the same path, because it's relative)
require_relative 'entry'
    
class AddressBook
    
    attr_accessor :entries
    
    def initialize
        @entries = []
    end

    def add_entry(name, phone_number, email)
        # index will store the insertion index
        index = 0
        entries.each do |entry|
            #Next we find the appropriate point to insert the new entry (lexicographic order - check this with Wilson)
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

end