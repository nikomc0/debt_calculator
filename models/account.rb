require 'sequel'

DB = Sequel.sqlite('./accounts.db')

class Account < Sequel::Model
	@@accounts = DB[:accounts]
	def view_all
		if @@accounts.all === []
			puts "No Accounts"
		else
			@@accounts.reverse(:balance)
		end
	end

	def total
		@@accounts.sum(:balance)
	end
end
