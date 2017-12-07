# Q: So, no need to include the file's extension? (address_book.rb)
require_relative '../models/address_book'

RSpec.describe AddressBook do
# I refactored by writing the next line and removing it from inside each test    
book = AddressBook.new

    describe "attributes" do
        it "responds to entries" do
            #book = AddressBook.new
            expect(book).to respond_to(:entries)
        end
        
        it "initalizes entries as an array" do
            #book = AddressBook.new
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            #book = AddressBook.new
            expect(book.entries.size).to eq(0)
        end
    end
        
    describe "#add_entry" do
        it "adds only one entry to the address book" do
            #book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq(1)
        end
 
        it "adds the correct information to entries" do
            #book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            # Multiple expects; if any of the fail, the entire it block will fail
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
    end
        
    describe "#remove_entry" do
        it "removes an entry" do
            #book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.add_entry('Marco Lopez', '55.3899.4741', 'mlopez@fundacionidea.org.mx')
            original_size = book.entries.size
            book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq(original_size - 1)
        end 
    end
        
end