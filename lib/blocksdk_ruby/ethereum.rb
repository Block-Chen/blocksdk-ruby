require_relative 'base'

class Ethereum < Base
	def getBlockChain(request = {})
		return request("GET","/eth/block")		
	end

	def getBlock(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]

		return request("GET","/eth/block/" + (request['block']).to_s,{"rawtx" => request['rawtx'],"offset" => request['offset'],"limit" => request['limit']})
	end

	def getMemPool(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/eth/mempool",{"rawtx" => request['rawtx'],"offset" => request['offset'],"limit" => request['limit']})
	end
	
	def listAddress(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/eth/address",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end

	def loadAddress(request = {})
		return request("POST","/eth/address/" + (request['address']).to_s + "/load",{"seed_wif" => request['seed_wif'],"password" => request['password']})
	end

	def unLoadAddress(request = {})
		return request("POST","/eth/address/" + (request['address']).to_s + "/unload")
	end

	def createAddress(request = {})
		request["name"].to_s.empty? ? request['name'] = 0 : request["name"]
		return request("POST","/eth/address",{"name" => request['name']})
	end
	
	def getAddressInfo(request = {})

		request["reverse"].to_s.empty? ? request['reverse'] = true : request['reverse']
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/eth/address/" + (request['address']).to_s ,{"reverse" => request['reverse'],"rawtx" => request['rawtx'],"offset" => request['offset'],"limit" => request['limit']})
	end
	
	def getAddressBalance(request = {})
		return request("GET","/eth/address/" + (request['address']).to_s + "/balance")
	end

	def sendToAddress(request = {})
		if request["gwei"].to_s.empty?
			blockChain = getBlockChain()
			request['gwei'] = blockChain['medium_gwei']
		end
		request["private_spend_key"].to_s.empty? ? request['private_spend_key'] = nil : request["private_spend_key"]
		request["password"].to_s.empty? ? request['password'] = nil : request["password"]
		
		return request("POST","/eth/address/" + (request['from']).to_s + "/sendtoaddress",{"address" => request['to'],"amount" => request['amount'],"private_key" => request['private_key'],"password" => request['password'],"gwei" => request['gwei']})
	end
	
	def sendTransaction(request = {})
		return request("POST","/eth/transaction",{"sign_hex" => request['sign_hex']})
	end

	def getTransaction(request = {})
		return request("GET","/eth/transaction/" + (request['hash']).to_s)
	end

end