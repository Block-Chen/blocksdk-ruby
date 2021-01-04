require_relative 'base'

class Price < Base
	def listPrice(request = {})
		return request("GET","/price")
	end
end

# priceInstance = Price.new("ad38QFTevz8fEEAG4fKsf4T5L8pwqgcy6LXMHpqU")
# puts priceInstance.listPrice()