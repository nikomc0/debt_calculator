DB = Sequel.sqlite('Accounts.db')
DB.migration do
	up do
		DB.drop_table :accounts
	end

	down do
		DB.create_table :accounts do 
			primary_key :id
			String  :account_name
			Integer :balance
			Integer :payment_amount
			Boolean :paid
		end
	end
end