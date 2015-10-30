
Tvcharacter.destroy_all
t1 = Tvcharacter.create :name => "Frank Underwood"
t2 = Tvcharacter.create :name => "Roger 'Verbal' Kint"
t3 = Tvcharacter.create :name => "Lester Burnham"
t4 = Tvcharacter.create :name => "John Doe"
t5 = Tvcharacter.create :name => "Prot"

Quote.destroy_all
require 'open-uri'
frank_url = "http://houseofcards2013.com/"
house_of_cards = Nokogiri::HTML(open(frank_url))

frank = house_of_cards.css("body div#container div#page_links a")
links = []
frank_quotes = []
fu_quotes = []
frank.each do |link|
	linktext = link.attr('href')
	list_quotes = Nokogiri::HTML(open(frank_url + linktext))
	frank_quotes << list_quotes.css("body div#container div#quotes ul li").text.strip.split("\n")
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

verbal_url = "http://www.imdb.com/character/ch0002072/quotes"
usual_suspects = Nokogiri::HTML(open(verbal_url))
verbal_quotes = usual_suspects.css("body#styleguide-v2 div#wrapper div#root layer div#pagecontent div#tn15 div#tn15main").text.strip.split("\n")
vk_quotes = []
verbal = []
v_quotes = []
verbal_quotes.each do |quote|
	matches = quote.match(/(Verbal:\s{3}.*)/)
	unless matches.nil?
		vk_quotes << matches[1]
	end
end

verbal = vk_quotes.join().split(/Verbal:\s{3}/)
verbal.each do |quote|
	quote.gsub!(/[A-Z][a-z]+\s[A-Z][a-z]+:.*/, "")
	v_quotes << quote
end
v_quotes.reject! { |quote| quote.empty? }
v_quotes.each { |quote| t2.quotes.create :character_quote => quote }

lester_url = "http://www.imdb.com/character/ch0002018/quotes"
american_beauty = Nokogiri::HTML(open(lester_url))
lester_quotes = american_beauty.css("body#styleguide-v2 div#wrapper div#root layer div#pagecontent div#tn15 div#tn15main").text.strip.split("\n")
lb_quotes = []
lester = []
l_quotes = []
lester_quotes.each do |quote|
	matches = quote.match(/(Lester Burnham:\s{3}.*)/)
	unless matches.nil? || matches[1].chars.length > 450
		lb_quotes << matches[1]
	end
end

lester = lb_quotes.join().split(/Lester Burnham:\s{3}/)
lester.each do |quote|
	quote.gsub!(/([A-Z][a-z]+\s){1,2}[A-Z][a-z]+:.*|Mr. Smiley's Manager:\s.*|\[.+?\]/, "")
	l_quotes << quote
end
l_quotes.reject! { |quote| quote.empty? }
l_quotes.each { |quote| t3.quotes.create :character_quote => quote }

john_url = "http://www.imdb.com/character/ch0026835/quotes"
se7en = Nokogiri::HTML(open(john_url))
john_quotes = se7en.css("body#styleguide-v2 div#wrapper div#root layer div#pagecontent div#tn15 div#tn15main").text.strip.split("\n")
jd_quotes = []
john = []
j_quotes = []
john_quotes.each do |quote|
	matches = quote.match(/(John Doe:\s{3}.*)/)
	unless matches.nil?
		jd_quotes << matches[1]
	end
end

john = jd_quotes.join().split(/John Doe:\s{3}/)
john.each do |quote|
	quote.gsub!(/([A-Z][a-z]+\s){1,2}[A-Z][a-z]+:.*|\[.+?\]/, "")
	j_quotes << quote
end
j_quotes.reject! { |quote| quote.empty? }
j_quotes.each { |quote| t4.quotes.create :character_quote => quote }

prot_url = "http://www.imdb.com/character/ch0009558/quotes"
k_pax = Nokogiri::HTML(open(prot_url))
prot_quotes = k_pax.css("body#styleguide-v2 div#wrapper div#root layer div#pagecontent div#tn15 div#tn15main").text.strip.split("\n")
pt_quotes = []
prot = []
p_quotes = []
prot_quotes.each do |quote|
	matches = quote.match(/(Prot:\s{3}.*)/)
	unless matches.nil?
		pt_quotes << matches[1]
	end
end

prot = pt_quotes.join().split(/Prot:\s{3}/)
prot.each do |quote|
	quote.gsub!(/D.*l:.*|\[.+?\]/, "")
	p_quotes << quote
end
p_quotes.reject! { |quote| quote.empty? }
p_quotes.each { |quote| t5.quotes.create :character_quote => quote }

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
