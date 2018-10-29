require 'redis'
require 'json'

redis = Redis.new

all_accounts = redis.smembers('accounts')
all_accounts.map do |t|
	if redis.hmget("#{t}", "account_name")[0] === "Chase"
		redis.del(t)
	end
end