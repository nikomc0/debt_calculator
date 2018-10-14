require 'sequel'

class Account
	DB = Sequel.connect('sqlite://Accounts.db')
	def initialize
		@accounts = DB[:accounts]
	end

	def view_accounts
		@accounts.all.each do |t|
			p t[:account_name]
			p t[:balance]
			p t[:paid]
		end
	end

	def add_account(account_name, balance)
		@accounts.insert(account_name: account_name, balance: balance)
	end
end
