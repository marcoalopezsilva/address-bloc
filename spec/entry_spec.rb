# Next line loads the entry model for testing. It is relative because of the ../
require_relative '../models/entry'
    # Next line: This file is a Spec file; tests Entry
    RSpec.describe Entry do
        # Next line: Describes our test structure. Here we say we'll test Entry's attributes
        describe "attributes" do
        # Next line avoids repeating the creation of a variable inside each test, so it's part of Refactoring
        let (:entry) {Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')}
            # Next block is an individual test (it... end)
            it "responds to name" do
                # entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
                # Next line: each test ends with an expect method. This checks whether entry.name is valid
                # Note: Watch the syntax: expect (entry) will not work (extra space)
                expect(entry).to respond_to(:name)
            end
            
            it "reports its name" do
                # entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
                expect(entry.name).to eq('Ada Lovelace')
            end 
            
            it "responds to phone number" do
                # entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
                expect(entry).to respond_to(:phone_number)
            end
            
             it "reports its phone numer" do
                # entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
                expect(entry.phone_number).to eq('010.012.1815')
            end
            
            it "responds to email" do
                # entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
                expect(entry).to respond_to(:email)
            end
            
            it "reports its email" do
                # entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
                expect(entry.email).to eq('augusta.king@lovelace.com')
            end 
        end
        
        describe "#to_s" do
            it "prints an entry as a string" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
            expect(entry.to_s).to eq(expected_string)
            end
        end
    end