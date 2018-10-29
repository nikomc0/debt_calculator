require 'sequel'

Sequel.migration do
  change do
    create_table(:accounts) do
      primary_key :id
      String :account_name
      Integer :balance
      Boolean :paid
    end
  end
end
