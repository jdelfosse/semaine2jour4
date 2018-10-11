def name
	require 'rubygems' 
	require 'nokogiri' 
	require 'open-uri'
	tab = []
	i = 0
	doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
	doc.xpath('//tbody/tr/td/a[@href][@class="currency-name-container link-secondary"]').each do |node| 
		y = 69
		while node.to_s[y] != ">" 
				y += 1
		end
		u = y + 1
		while node.to_s[u] != "<" 
			u += 1
		end
		u -= 1
		y += 1
		tab[i] = node.to_s[y..u]
		i += 1
	end 
	return (tab)
end

def valu
	i = 0
	tab2 = []
	doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
	doc.xpath('//tbody/tr/td/a[@data-usd][@class="price"]').each do |node| 
		y = 22
		while node.to_s[y] != "#" 
			y += 1
		end
		y += 34
		u = y + 1
		while node.to_s[u] != "\"" 
			u += 1
		end
		u -= 1
		tab2[i] = node.to_s[y..u]
		i += 1
	end 
	return tab2
end

def main
	tab = name
	tab2 = valu
	hash = Hash[tab.zip(tab2)]
	return hash
end		


puts main