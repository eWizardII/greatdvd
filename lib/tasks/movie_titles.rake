desc "Fetch Movie Titles"
task :fetch_titles => :environment do
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'
	url = "http://en.wikipedia.org/wiki/List_of_films:_A"
	doc = Nokogiri::HTML(open(url, 'User-Agent' => 'ruby'))
	puts doc.at_css("title").text
	doc.css("i").each do |movies|
	  title = movies.text
	  #puts "#{title}"
	  Movie.create(:title => title)
	end
end