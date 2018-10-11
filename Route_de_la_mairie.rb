def get_all_the_urls_of_val_doise_townhalls

	require 'rubygems' 
	require 'nokogiri' 
	require 'open-uri'
	
	i = 0
	tab = []

	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")) 
	doc.xpath('//p/a').each do |node| 
		y = 27
		while node.to_s[y] != "\"" 
			y += 1
		end
		y -= 1
		tab[i] = "http://annuaire-des-mairies.com" + node.to_s[26..y]
		i += 1
	end 
	return(tab)
end

def get_the_email_of_a_townhal_from_its_webpage(url)
	require 'rubygems' 
	require 'nokogiri' 
	require 'open-uri'
	i = 0
	tab = []
	tab2 = []
	while i < url.size
		doc = Nokogiri::HTML(open(url[i]))
		node2 = doc.xpath('/html/body/div/main/section[1]/div/div/div/h1').to_s
		node = doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').to_s
		tab[i] = node[4..node.size-6]
		y = 5
		while node2.to_s[y] != " " 
			y += 1
		end
		y -= 1
		tab2[i] = node2[4..y]
		i += 1
	end
	hash = Hash[tab2.zip(tab)]
	return hash
end

def main
	tab = get_all_the_urls_of_val_doise_townhalls
	puts get_the_email_of_a_townhal_from_its_webpage(tab)
end

main