desc "Fetch Movie Titles"
task :fetch_titles => :environment do
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'
	url = "http://www.amazon.com/s/ref=lp_2649512011_nr_p_n_theme_browse-bin_0?rh=n%3A2625373011%2Cn%3A%212625374011%2Cn%3A2649512011%2Cp_n_theme_browse-bin%3A2650363011&bbn=2649512011&ie=UTF8&qid=1329030721&rnid=2650362011"
	doc = Nokogiri::HTML(open(url))
	doc.css(".product").each do |product|
		title = product.at_css(".title .title").text
		Movie.create(:title => title)
	end
end