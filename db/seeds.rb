
Tvcharacter.destroy_all
t1 = Tvcharacter.create :name => "Frank Underwood"


Quote.destroy_all
require 'open-uri'

f_underwood = Nokogiri::HTML(open("http://www.imdb.com/character/ch0518097/quotes"))
frank_quotes = []
quotes = f_underwood.css("body.fixed div#wrapper div#root layer div#pagecontent div.quotes div#tn15main div#tn15content").text.strip

# quotes = quotes.split "\n\n"
quotes = quotes.split /Francis Underwood:\s\s\s|\n+/
# quotes = quotes.split (/\n+/)

quotes.each do |quote|
	quote = quote.chomp.chomp.chomp
	if quote.match(/[A-Z][a-z]+\s[A-Z][a-z]+:\s|".*\)|\[.*\]|Freddy:.+|The content.+staff|One heartbeat away from the presidency and not a single vote cast in my name. Democracy is so overrated.|[A-Z].+overated/)
		quote.gsub(/[A-Z][a-z]+\s[A-Z][a-z]+:\s|".*\)|\[.*\]|Freddy:.+|The content.+staff|One heartbeat away from the presidency and not a single vote cast in my name. Democracy is so overrated.|[A-Z].+overated/, "")
	else frank_quotes << quote if quote.match(/.+[^\n+]/)
	end
end

frank_quotes.each do |quote|
	t1.quotes.create :character_quote => quote
end
