require_relative 'account_controller.rb'

$accounts = AccountsController.new

class MenuController

	def bench(descr)
    start = Time.now
    yield
    puts "#{descr} #{Time.now-start} seconds"
	end
	
	def main_menu
		puts "Command Line Calculator"
		puts "1. View Accounts"
		puts "2. Add Account"
		puts "3. Calculate Payment"
		puts "4. Total Balance"
		print "\n Enter your selection: "
		selection = gets.to_i

		case selection
		when 1
			system "clear"
			puts "Here are your accounts"
			bench('View Accounts') {
				$accounts.view_accounts
				edit_sub_menu
			}
		when 2 
			system 'clear'
			puts 'Add an account:'
			system 'clear'
			puts 'Account Name?'
			account_name = gets.chomp
			system 'clear'
			puts 'Account Balance'
			balance = gets.chomp
			system 'clear'

			$accounts.add_account(account_name, balance)
			puts 
			main_menu
		when 4
			system 'clear'
			$accounts.total_balance
			puts
			main_menu
		end
	end
end

def edit_sub_menu
	system "clear"
	print "\n"
	puts "Select an account to edit:"	
	print "\n Enter the account name: "
	account_name = gets.chomp
	$accounts.get_account(account_name)
	puts
	puts "Edit name y or n?"
	name_change = gets.chomp
	if name_change === 'y' or name_change === "Y"
		puts "Enter the new name"
		new_account_name = gets.chomp
		$accounts.update(account_name, new_account_name)
		puts 
		
	else
		old_account_name = account_name
		$accounts.update(account_name, old_account_name)
		puts "Adjust balance y or n?"
		balance_edit = gets.chomp
		if balance_edit === 'y' or balance_edit === "Y"
			puts "Enter the new balance"
			new_balance = gets.chomp.to_i
			$accounts.update(account_name, new_balance)
		else
			main_menu
		end
	end
end

def change_name
end

def adjust_balance
end
# def account_sub_menu(account)
# 	system "clear"
# 	print "#{@account.get_account(account)}"
# 	puts "\n"
# 	puts "1. Edit"
# 	puts "2. Delete"
# 	print "\n Enter your selection: "
# 	selection = gets.to_i

# 		case selection
# 		when 1
# 			system "clear"
# 			puts "Something"
# 		when 2 
# 			system "clear"
# 			delete_account
# 		end
# end
