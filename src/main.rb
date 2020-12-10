require 'yaml'
require_relative ("member.rb")

# class MyOwnErrorClass < StandardError
# end

class InvalidMemberDetails < StandardError
end

def write_to_file(member_details)
    # Here is a scenario where we try to search for a file to open it and write to it
    #  this begin rescue block ensures that if there is an error while during the file open / write operation in the BEGIN block, it is handled in the rescue block
    begin
        # This is a behaviour that mimicks storing data to a DB - for now its just a file that we are dealing with
        file = File.open("../data/members.yml","a+"){ |file| file.write(member_details.to_yaml)}
        if file
            puts "New member details saved successfully to file"
        end
    rescue
        puts "File not found"
        puts "Could not save member details to the file"
    end
end

def get_details
    member_details = Hash.new{0}
	puts "Please enter your first name : "
	member_details[:first_name] = gets.strip
    puts "Please enter your last name : "
    member_details[:last_name] = gets.strip    
    puts "Please enter your address : "
    member_details[:address] = gets.strip
    return member_details
end

def validate_details(member_details)
	raise InvalidMemberDetails if(member_details[:first_name].length == 0 || member_details[:last_name].length == 0 || member_details[:address].length == 0)
	return true
end

def create_member
    member_details = get_details
    # This begin rescue end block ensures that the user enters valid inputs by raising a InvalidMemberDetails error which extends StandardError class.
    begin
		validate_details(member_details)
    rescue
        puts "You did not enter complete member details. Please try again"
        return false
	end
    member = Member.new(member_details)
    # puts member calls the to_s method of the Member class
    puts member
    write_to_file(member_details)
end

while true
    input_options_array = ["1","2","3","4"]
    puts "Hi There! Welcome to the Library App !!"
    puts "Please choose from the following options : "
    puts "Enter (1) to become a member"
    puts "Enter (2) to proceed as an existing member"
    puts "Enter (3) to cancel membership"
    puts "Press (4) to exit"
    input_option = gets.strip 
    # This is the simplest form of error handling using an if statement where we are not explicitly using any begin-rescue-end block
    if !input_options_array.include?(input_option)
        puts "Expecting an Integer as an input : 1,2,3 OR 4 "
        next
    end
    case input_option
        when "1"
            puts "Lets get started with your new account : "
            create_member     
        when "2"
            # Invoke a method called existing_member
            puts "Option 2 - if you are an existing member"
        when "3"
            puts "Option 3 - for cancelling membership"
        when "4"
            puts "Exiting from the Library App ..."
            break
        else
            puts "Please choose from the options: 1, 2, 3 OR 4"
            next
    end # end of case statement
end # End of while loop



