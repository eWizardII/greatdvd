require 'open-uri'
require 'indextank'

api = IndexTank::Client.new(ENV['SEARCHIFY_API_URL'] ||'http://:fOC8cPwr4O2Wi4@22woj.api.searchify.com')
index = api.indexes('idx')

# class Movie < ActiveRecord::Base
# 	def self.search(search)
# 		if search
# 			find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
# 		else
# 			find(:all)
# 		end
# 	end
# end

class Movie < ActiveRecord::Base
	# Obtain an IndexTank client
	def self.index
		@api = IndexTank::Client.new(ENV['SEARCHIFY_API_URL'] ||'http://:fOC8cPwr4O2Wi4@22woj.api.searchify.com')
		@index ||= @api.indexes('idx')
		@index
	end

	# IndexTank Retrival
	def self.search(search, start)
		index.search(search, :fetch => 'text,docid', :start => start)
	end
end