class Member
    attr_reader :first_name, :last_name, :address, :returned_books
    attr_accessor :books_array, :return_books_array
    # here member_id is a class variable which keeps track of the count of the newly added library members and adds one everytime a new member is created.
    @@member_id = 0
    def initialize(member_details)
        @first_name = member_details[:first_name]
        @last_name = member_details[:last_name]
        @address = member_details[:address]
        @books_array = []
        @return_books_array = []
		@returned_books = [] # this is to track the borrowing history
        @@member_id += 1
    end

    def borrow_new_book(book) # add a new book to the books_array
        @books_array << book
    end

    def prepare_books_to_return(book)
        @return_books_array << book
    end

    def show_books_borrowed # View all books in the books array
        @books_array.each {|book| puts book}
    end

    def show_books_pending
    # to be implemented during TDD
    end

    def show_borrow_history
    # to be implemented during TDD  
    end

    # this method prints a welcome message to the user and also gives them a new membership number.
    def to_s
        return "Welcome to the Library App #{@first_name} #{@last_name}. Your membership number is #{@@member_id}"
    end
end
