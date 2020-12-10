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

describe 'Show books to be returned' do
	member_details = {first_name: "Cookie", last_name: "Monster", address: "Brisbane"}
	it 'Shows the books not returned' do
		member = Member.new(member_details)
		member.books_array = ["book1","book2","book3","book4","book5","book6"]
		member.return_books_array = ["book1","book2","book3"]
		expect(member.show_books_pending).to eq(["book4","book5","book6"])		
	end
end

describe 'Member Borrow history' do
	it 'shows the books that a member has read' do
		member_details = {first_name: "Cookie", last_name: "Monster", address: "Brisbane"}
		member = Member.new(member_details)
		member.borrow_new_book("book1")
		member.borrow_new_book("book2")
		member.prepare_books_to_return("book1")
		member.show_books_pending
		expect(member.returned_books.length).to eq 1
		expect(member.returned_books[0]).to eq("book1")
		expect(member.show_borrow_history).to eq(["book1"])
	end
end


