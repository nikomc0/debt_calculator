require_relative '../models/account.rb'
require 'redis'

$DB = DB[:accounts]
$redis = Redis.new
$all_accounts = $redis.smembers('accounts')
$accounts = $redis.scard 'accounts'
$account_name = "account#{$accounts}"

class AccountsController
	@@accounts = Account.new

	def view_accounts
		$redis.smembers('accounts').each do |t|
			puts "#{$redis.hget("#{t}", 'account_name')} #{$redis.hget("#{t}", 'balance')}"
		end
	end

# TODO: Switch to REDIS
	def get_account(acct)
		$DB.where(account_name: acct).each do |t|
			puts "#{t[:account_name]}: #{t[:balance]}"
		end
	end

	def add_account(account_name, balance)
		puts $account_name
		$redis.hmset $account_name,
			'account_name', "#{account_name}",
			'balance', "#{balance}",
			'paid', false

		$redis.sadd('accounts', $account_name)
		$accounts += 1
	end

# TODO: Switch to REDIS
	def total_balance
		puts "Total Balance: #{@@accounts.total}"
	end

# TODO: Switch to REDIS
	def update(account, attribute)
		account = $DB.where(account_name: account)
		if attribute.is_a?(String)
			account.update(account_name: "#{attribute}")
		else
			account.update(balance: "#{attribute}")
		end
	end

# TODO: Switch to REDIS
	def delete_account(account_name)
		# Redis Way
		$all_accounts.map do |t|
			# Remove account key
			if $redis.hmget(t, "account_name")[0] === account_name
				# $redis.del(t)
				puts t
				# Remove account from the set
				# $redis.srem(t)
			else
				puts "Account doesn't exist."
			end
		end

		# Sequel Way
		# puts "#{$DB.where(account_name: "#{account_name}")}"
	end
end
