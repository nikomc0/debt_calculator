# Set the accounts table
DB = Sequel.sqlite('Accounts.db')

DB.migration do 
	change do 
		add_column :balance, Integer
	end
end

DB.create_table :accounts do 
	primary_key :id
	String  :account_name
	Integer :balance
	Integer :payment_amount
	Boolean :paid
end
