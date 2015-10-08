
Tvcharacter.destroy_all
t1 = Tvcharacter.create :name => "Frank Underwood"
t2 = Tvcharacter.create :name => "Claire Underwood"
t3 = Tvcharacter.create :name => "Zoe Barnes"


Quote.destroy_all
require 'open-uri'
house_of_cards = Nokogiri::HTML(open("https://en.wikiquote.org/wiki/House_of_Cards_(U.S._TV_series)"))

character_quotes = house_of_cards.css("body div.mw-body div.mw-body-content div.mw-content-ltr dl dd").text.strip


frank_quotes = character_quotes.split(/Frank Underwood:\s/)
f_quotes = []
frank_quotes.each do |quote|
	#needs to be destructive otherise changes won't be pushed through 
	quote.gsub!(/([A-Z][a-z]+(\.){,1}(\s[A-Z][a-z]+){,1}:\s.*|\[.+?\]\s?)/, "")
	#the ?/] prevents the selector from over-reaching if there is more than one [...] in a quote block
	f_quotes << quote
	
end

f_quotes.reject! { |quote| quote.empty? }
f_quotes.each { |quote| t1.quotes.create :character_quote => quote }


claire_quotes = character_quotes.split(/Claire Underwood:\s/)
c_quotes = []
claire_quotes.each do |quote|
	quote.gsub!(/([A-Z][a-z]+\s[A-Z][a-z]+:\s.*|\[.+?\]\s?)/, "") 
	c_quotes << quote
end

c_quotes.reject! { |quote| quote.empty? || quote.chars.length < 11 }
c_quotes.each { |quote| t2.quotes.create :character_quote => quote }

zoe_quotes = character_quotes.split(/Zoe Barnes:\s/)
z_quotes = []
zoe_quotes.each do |quote|
	quote.gsub!(/([A-Z][a-z]+\s[A-Z][a-z]+:\s.*|\[.+?\]\s?|[A-Z][a-z]+:\s.*)/, "")
	z_quotes << quote
end

z_quotes.reject! { |quote| quote.empty? || quote.chars.length < 11 }
z_quotes.each { |quote| t3.quotes.create :character_quote => quote }

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
