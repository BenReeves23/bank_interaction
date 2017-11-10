class Customer
	attr_accessor :name, :pin
	def initialize (name, pin)
		@name = name
		@pin = pin
	end
end

class Account
	attr_accessor :customer, :balance, :account_number
	def initialize (customer, balance, account_number)
		@customer = customer
		@balance = balance
		@account_number = account_number
	end
end

