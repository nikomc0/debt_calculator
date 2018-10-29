require 'sequel'

DB = Sequel.connect('sqlite://Accounts.db')

class Account < Sequel::Model

	def initialize
		@accounts = DB[:accounts]
	end

	# def view_accounts
	# 	@accounts.all.each_with_index do |t, i|
	# 		puts "#{i + 1}: #{t[:account_name]} - #{t[:balance]}"
	# 	end
	# end

	def get_account(account_id)
		@accounts.where(id: account_id - 1)
	end

	def add_account(account_name, balance)
		@accounts.insert(account_name: account_name, balance: balance)
	end

	def delete_account(account_name)
		@accounts.where(account_name: account_name)
	end
end
