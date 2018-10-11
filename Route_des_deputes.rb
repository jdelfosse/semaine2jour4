def get_all_the_urls_of_val_doise_townhalls
	require 'rubygems' 
	require 'nokogiri' 
	require 'open-uri'
	i = 0
	tab = []
	doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")) 
	doc.xpath('//div/div/ul/li/a').each do |node| 
		y = 10
		while node.to_s[y] != "\"" 
			y += 1
		end
		y -= 1
		if node.to_s[9] == "#"
			return tab
		end
		tab[i] = "http://www2.assemblee-nationale.fr" + node.to_s[9..y]
		i += 1 
	end 
	return tab
end

def get_the_email_of_a_townhal_from_its_webpage(url)
	tab2 = []
	tab3 = []
	i = 0
	require 'rubygems' 
	require 'nokogiri' 
	require 'open-uri'
	while i < url.size
		doc = Nokogiri::HTML(open(url[i]))
		node = doc.xpath('//div/section/dl/dd[1]/a[@class="email"]')
		y = 31
		puts i
		while node.to_s[y] != "\"" && y < 500
			y += 1
		end
		y -= 1
		tab2[i] = node.to_s[30..y]
		y += 22
		tab3[i] = node.to_s[y..node.to_s.size - 5]
		i += 1
	end
	hash = Hash[tab3.zip(tab2)]
	return hash
end


def main
	tab = get_all_the_urls_of_val_doise_townhalls
	return get_the_email_of_a_townhal_from_its_webpage(tab)
end

puts main