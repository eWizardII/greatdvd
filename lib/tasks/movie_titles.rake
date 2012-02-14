desc "Fetch Movie Titles"
task :fetch_titles => :environment do
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	characters = ["numbers","A","B","C","D","E","F","G","H","I","J-K","L","M","N-O","P","Q-R","S","T","U-V-W","X-Y-Z"]

	for xxx in 0...20
		url = "http://en.wikipedia.org/wiki/List_of_films:_#{characters[xxx]}"
		doc = Nokogiri::HTML(open(url, 'User-Agent' => 'ruby'))
		puts doc.at_css("title").text
		doc.css("i").each do |movies|
		  title = movies.text
		  Movie.create(:title => title)
		end
	end

	# url = "http://en.wikipedia.org/wiki/List_of_films:_A"
	# doc = Nokogiri::HTML(open(url, 'User-Agent' => 'ruby'))
	# doc.css("i").each do |movies|
	#   title = movies.text
	#   #puts "#{title}"
	#   Movie.create(:title => title)
	# end
end