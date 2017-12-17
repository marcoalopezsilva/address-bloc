# Q: So, no need to include the file's extension? (address_book.rb)
require_relative '../models/address_book'

RSpec.describe AddressBook do
# I refactored by writing the next line and removing it from inside each test    
    let(:book) { AddressBook.new }
    # The above is the same as:
    #before do
    #@book = AddressBook.new
    #end
    #but if we used @book we'd have to change the variable to @book in the rest of the code

    #We create a helper method
    def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eq expected_name
        expect(entry.phone_number).to eq expected_number
        expect(entry.email).to eq expected_email
    end
    
    describe "attributes" do
        it "responds to entries" do
            expect(book).to respond_to(:entries)
        end
        
        it "initalizes entries as an array" do
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
        end
    end
        
    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq(1)
        end
 
        it "adds the correct information to entries" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            # Multiple expects; if any of the fail, the entire it block will fail
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
    end
    
    #Test import from entries.csv
    describe "#import_from_entries.csv" do
        it "imports the correct number of entries" do
            book.import_from_csv("entries.csv")
            book_size = book.entries.size
            #NL: Checks the size of the entries in AddressBook (assuming csv has 5)
            expect(book_size).to eq 5
        end
        
        it "imports the 1st entry" do
            book.import_from_csv("entries.csv")
            entry_one = book.entries[0]
            check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
        end
        it "imports the 2nd entry" do
            book.import_from_csv("entries.csv")
            # Check the second entry
            entry_two = book.entries[1]
            check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
        end
        it "imports the 3rd entry" do
            book.import_from_csv("entries.csv")
            # Check the third entry
            entry_three = book.entries[2]
            check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
        end
 
        it "imports the 4th entry" do
            book.import_from_csv("entries.csv")
            # Check the fourth entry
            entry_four = book.entries[3]
            check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
        end
 
        it "imports the 5th entry" do
            book.import_from_csv("entries.csv")
            # Check the fifth entry
            entry_five = book.entries[4]
            check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
        end
    end
    
    describe "#import_from_entries_2.csv" do
        it "imports the correct number of entries" do
            book.import_from_csv("entries_2.csv")
            book_size = book.entries.size
            #NL: Checks the size of the entries in AddressBook (we know they are 3)
            expect(book_size).to eq 3
        end
        
        it "imports the 1st entry" do
            book.import_from_csv("entries_2.csv")
            entry_one = book.entries[0]
            check_entry(entry_one, "Alberto", "55-2922-5657", "alberto@blocmail.com")
        end
        it "imports the 2nd entry" do
            book.import_from_csv("entries_2.csv")
            # Check the second entry
            entry_two = book.entries[1]
            check_entry(entry_two, "Marco", "55-3899-4741", "marco@blocmail.com") 
        end
        it "imports the 3rd entry" do
            book.import_from_csv("entries_2.csv")
            # Check the third entry
            entry_three = book.entries[2]
            check_entry(entry_three, "Paola", "55-2335-4377", "paola@blocmail.com")
        end

    end
    
    #Test for removal of entries
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