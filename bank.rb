# 1. Make sure that the bank.rb file can use the classes in the bank_classes.rb
# 2. Create methods in a typical bank interaction
	# - welcome the customer, what brings them to the bank? Sign-up? Sign-in?
	# - if sign in (check that they have signed up)
	# 	*possible interactions create, review(show account), sign out

require_relative "bank_classes.rb"

def menu
	puts "Would you like to sign in, or sign up today? (Select 1 or 2)"
	puts "1. Sign In"
	puts "2. Sign Up"
	choice = gets.chomp.to_i

	case choice
		when 1
			system ("cls")
			sign_in
		when 2
			system ("cls")
			sign_up
		else
			system ("cls")
			puts "Invalid selection."
			menu
	end
end

def sign_in
	puts "What is your name? "
	name = gets.chomp
	puts "What is your 4-digit pin? "
	pin = gets.chomp.to_i
	# if @all_customers.empty?
	# 	puts "checking if it saved"
	# end
	@all_customers.each do |x|
		if x.pin == pin && x.name == name
			account
		else
			puts "Were you able to sign up yet?"
			menu
		end
	end
end

@all_customers = []

def sign_up

	puts "What is your first and last name: "
	name = gets.chomp
	puts "Select a 4 digit pin: "
	pin = gets.chomp.to_i

	@current = Customer.new(name,pin)
	@all_customers.push(@current)
	
	menu
end

@accounts = []

def account
	puts "Do you want to 1. view existing accounts or 2. create a new account?"
	ans = gets.chomp.to_i
		case ans 
		when 1
			checkings
		when 2
			new_account
		end
end

def checkings
	@accounts.each do |x|
		if x.customer == @current
			@account_info == x
		puts "What would you like to do, 1,2, or 3."
		puts "1. View Balance"
		puts "2. Deposit money"
		puts "3. Withdraw money"
		guide = gets.chomp.to_i
			case guide
			when 1
				puts @accounts_info.balance
			end

		else
			puts "User not found, have you created an account with us yet?"
			new_account
		end
	end
end

def new_account
	puts "Insert your starting balance"
	balance = gets.chomp.to_i
	puts "We will give you an account number"
	number = srand(4)
	puts number 

	@account_info = Account.new(@current,balance,number)
	@accounts.push(@account_info)

	account
end

menu