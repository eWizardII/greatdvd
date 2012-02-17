desc "Fetch Movie Titles"
task :fetch_titles_index => :environment do
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'
	require 'indextank'

	# Obtain an IndexTank client
	client = IndexTank::Client.new(ENV['SEARCHIFY_API_URL'] || 'http://:fOC8cPwr4O2Wi4@22woj.api.searchify.com')
	index = client.indexes('idx')

	characters = ["numbers","A","B","C","D","E","F","G","H","I","J-K","L","M","N-O","P","Q-R","S","T","U-V-W","X-Y-Z"]

	#characters = ["numbers", "A"]
	indexnumber = 1

	documents = []

	for xxx in 0...20
		url = "http://en.wikipedia.org/wiki/List_of_films:_#{characters[xxx]}"
		doc = Nokogiri::HTML(open(url, 'User-Agent' => 'ruby'))
		puts doc.at_css("title").text
		doc.css("i").each do |movies|
		  title = movies.text
		  documents << { :docid => indexnumber, :fields => { :text => title} }
		  indexnumber += 1
		end
		response = index.batch_insert(documents)

		# Failed document handling

		failures = 0

		failed_documents = []
		response.each_with_index do |r, i|
			failed_documents << documents[i] unless r['added']
			failures += 1
		end

		puts failed_documents
		puts failures

		documents = []
	end
end