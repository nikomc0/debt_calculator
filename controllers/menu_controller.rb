require_relative '../models/account.rb'

class MenuController
	attr_reader :account
	
	def initialize
		@account = Account.new
	end

	def main_menu
		puts "Command Line Calculator"
		puts "1. View Accounts"
		puts "2. Add Account"
		puts "3. Calculate Payment"
		print "Enter your selection:"
		selection = gets.to_i

		case selection
		when 1
			system "clear"
			view_accounts
		when 2 
			system "clear"
			add_account
		end
	end

	def view_accounts
		system "clear"
		puts "Here are your accounts"
		@account.view_accounts
		# account_sub_menu
	end
end

def add_account
	system "clear"
	puts "New Account"
	puts "What is the Account Name?"
	account_name = gets.chomp
	system "clear"
	puts "What is the Account Balance?"
	balance = gets.chomp.to_i
	system "clear"

	@account.add_account(account_name, balance)
end

def account_sub_menu
	system "clear"
	puts "Edit Account:"
	puts "What is the Account Name?"
	account_name = gets.chomp
	system "clear"
	puts "What is the current Balance?"
	balance = gets.chomp
	system "clear"
	p account_name + " " + balance
end
