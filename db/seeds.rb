
Tvcharacter.destroy_all
t1 = Tvcharacter.create :name => "Frank Underwood"
# t2 = Tvcharacter.create :name => "Claire Underwood"
# t3 = Tvcharacter.create :name => "Zoe Barnes"


Quote.destroy_all
require 'open-uri'
url = "http://houseofcards2013.com/"
house_of_cards = Nokogiri::HTML(open(url))

frank = house_of_cards.css("body div#container div#page_links a")
links = []
frank_quotes = []
fu_quotes = []
frank.each do |link|
	linktext = link.attr('href')
	list_quotes = Nokogiri::HTML(open(url + linktext))
	frank_quotes << list_quotes.css("body div#container div#quotes ul li").text.strip.split("\n")
	# frank_quotes[1].gsub!(/(\"\s+)/, "")
end
frank_quotes.flatten!
frank_quotes.flatten!

frank_quotes.each do |quote|
	quote.gsub!(/\s+{2}/, "")
	quote.gsub!(/Clair/, "Claire")
	quote.gsub!(/\. \. \.| \. \. \./, "...")
	quote.gsub!(/W.*Francis\.|I.*President\.|W.*Frances\.{3}/, "")
	quote.gsub!(/^(the most.)/, "")
	quote.gsub!(/It bought me influence precisely when I needed it\s/, "It bought me influence precisely when I needed it the most.")
	fu_quotes << quote
end
fu_quotes.reject! { |quote| quote.empty? }
fu_quotes.each { |quote| t1.quotes.create :character_quote => quote }


# frank_quotes = character_quotes.split(/Frank Underwood:\s/)
# f_quotes = []
# frank_quotes.each do |quote|
# 	#needs to be destructive otherise changes won't be pushed through 
# 	quote.gsub!(/([A-Z][a-z]+(\.){,1}(\s[A-Z]{,1}[a-z]+){,1}:\s.*|\[.+?\]\s?)/, "")
# 	#the ?/] prevents the selector from over-reaching if there is more than one [...] in a quote block

# 	f_quotes << quote
	
# end

# f_quotes.reject! { |quote| quote.empty? }
# f_quotes.each { |quote| t1.quotes.create :character_quote => quote }


# claire_quotes = character_quotes.split(/Claire Underwood:\s/)
# c_quotes = []
# claire_quotes.each do |quote|
# 	quote.gsub!(/([A-Z][a-z]+(\.){,1}(\s[A-Z][a-z]+){,1}:\s.*|\[.+?\]\s?)/, "") 
# 	c_quotes << quote
# end

# c_quotes.reject! { |quote| quote.empty? || quote.chars.length < 11 }
# c_quotes.each { |quote| t2.quotes.create :character_quote => quote }

# zoe_quotes = character_quotes.split(/Zoe Barnes:\s/)
# z_quotes = []
# zoe_quotes.each do |quote|
# 	quote.gsub!(/([A-Z][a-z]+(\.){,1}(\s[A-Z][a-z]+){,1}:\s.*|\[.+?\]\s?)/, "")
# 	z_quotes << quote
# end

# z_quotes.reject! { |quote| quote.empty? || quote.chars.length < 11 }
# z_quotes.each { |quote| t3.quotes.create :character_quote => quote }

# f_underwood = Nokogiri::HTML(open("http://www.imdb.com/character/ch0518097/quotes"))
# frank_quotes = []
# quotes = f_underwood.css("body.fixed div#wrapper div#root layer div#pagecontent div.quotes div#tn15main div#tn15content").text.strip

# # quotes = quotes.split "\n\n"
# quotes = quotes.split /Francis Underwood:\s\s\s|\n+/
# # quotes = quotes.split (/\n+/)

# quotes.each do |quote|
# 	quote = quote.chomp.chomp.chomp
# 	if quote.match(/[A-Z][a-z]+\s[A-Z][a-z]+:\s|".*\)|\[.*\]|Freddy:.+|The content.+staff|One heartbeat away from the presidency and not a single vote cast in my name. Democracy is so overrated.|[A-Z].+overated/)
# 		quote.gsub(/[A-Z][a-z]+\s[A-Z][a-z]+:\s|".*\)|\[.*\]|Freddy:.+|The content.+staff|One heartbeat away from the presidency and not a single vote cast in my name. Democracy is so overrated.|[A-Z].+overated/, "")
# 	else frank_quotes << quote if quote.match(/.+[^\n+]/)
# 	end
# end

# frank_quotes.each do |quote|
# 	t1.quotes.create :character_quote => quote
# end
