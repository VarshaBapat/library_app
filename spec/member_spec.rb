require_relative('../src/member')

describe Member do
	member_details = member_details = {first_name: "Cookie", last_name: "Monster", address: "Brisbane"}
	book = "Ruby for Beginners"
	it 'can create without raising exception' do
		expect{member = Member.new(member_details)}.not_to raise_error
	end
	it 'can create a member' do
		member = Member.new(member_details)
		expect(member.first_name).to eq(member_details[:first_name])
		expect(member.last_name).to eq(member_details[:last_name])
		expect(member.address).to eq(member_details[:address])
	end
	it 'member can borrow a book' do
		member = Member.new(member_details)
		member.borrow_new_book(book)
		expect(member.books_array.length).to eq(1)
		expect(member.books_array[0]).to eq(book)
	end
end

describe 'Show books pending for return' do
	# check how many books are pending for return - how many books are remaining with the member 
	member_details = {first_name: "Cookie", last_name: "Monster", address: "Brisbane"}
	member = Member.new(member_details)
	member.books_array = ["book1","book2","book3","book4","book5","book6"] # these are the books that were borrowed by the member
	member.return_books_array = ["book1","book2","book3"] # these are the books that were returned by the member.
	it 'Shows the books not returned' do
		# expect "show_books_pending" to return "a list of books that are pending for return"
		expect(member.show_books_pending).to eq(["book4","book5","book6"])	
	end
end


describe 'Member Borrow history' do
	member_details = {first_name: "Cookie", last_name: "Monster", address: "Brisbane"}
	member = Member.new(member_details)
	member.borrow_new_book("book1")
	# @books_array = ["book1"]
	member.borrow_new_book("book2")
	# @books_array = ["book1","book2"]
	member.prepare_books_to_return("book1")
	# @return_books_array = ["book1"]
	it 'shows the books that a member has read' do
		expect(member.show_borrow_history).to eq(["book1"])
	end
end


