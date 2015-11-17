require_relative '../models/address_book'
RSpec.describe AddressBook do

	let(:book) { AddressBook.new }

  describe "attributes" do

    it "should respond to entries" do 
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
       expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
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

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

	describe "#import_from_csv" do

		it "imports the correct number of entries" do

			book.import_from_csv("entries.csv")
			book_size = book.entries.size

			expect(book_size).to eq 5
		end

		it "imports the 1st entry" do
			book.import_from_csv("entries.csv")
			entry_one = book.entries[0]

			expect(entry_one.name).to eq "Bill"
			expect(entry_one.phone_number).to eq "555-555-4854"
			expect(entry_one.email).to eq "bill@blocmail.com"
		end




	end

end
