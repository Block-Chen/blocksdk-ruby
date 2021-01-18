require_relative 'base'

class Ethereum < Base
	def getBlockChain(request = {})
		return request("GET","/eth/info")		
	end

	def getBlock(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]

		return request("GET","/eth/blocks/" + (request['block']).to_s,{"rawtx" => request['rawtx'],"offset" => request['offset'],"limit" => request['limit']})
	end

	def getMemPool(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/eth/mempool",{"rawtx" => request['rawtx'],"offset" => request['offset'],"limit" => request['limit']})
	end
	
	def getAddress(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/eth/addresses",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end

	def loadAddress(request = {})
		return request("POST","/eth/addresses/" + (request['address']).to_s + "/load",{"private_key" => request['private_key'],"password" => request['password']})
	end

	def unloadAddress(request = {})
		return request("POST","/eth/addresses/" + (request['address']).to_s + "/unload")
	end

	def createAddress(request = {})
		request["name"].to_s.empty? ? request['name'] = 0 : request["name"]
		return request("POST","/eth/addresses",{"name" => request['name']})
	end
	
	def getAddressInfo(request = {})

		request["reverse"].to_s.empty? ? request['reverse'] = true : request['reverse']
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/eth/addresses/" + (request['address']).to_s ,{"reverse" => request['reverse'],"rawtx" => request['rawtx'],"offset" => request['offset'],"limit" => request['limit']})
	end
	
	def getAddressBalance(request = {})
		return request("GET","/eth/addresses/" + (request['address']).to_s + "/balance")
	end

	def sendToAddress(request = {})
		if request["gwei"].to_s.empty?
			blockChain = getBlockChain()
			request['gwei'] = blockChain['medium_gwei']
		end
		request["private_key"].to_s.empty? ? request['private_key'] = nil : request["private_key"]
		request["password"].to_s.empty? ? request['password'] = nil : request["password"]
		request["gas_limit"].to_s.empty? ? request['gas_limit'] = nil : request["gas_limit"]
		
		return request("POST","/eth/addresses/" + (request['from']).to_s + "/sendtoaddress",{"to" => request['to'],"amount" => request['amount'],"private_key" => request['private_key'],"password" => request['password'],"gwei" => request['gwei'],"gas_limit" => request['gas_limit']})
	end
	
	def sendTransaction(request = {})
		return request("POST","/eth/transactions/send",{"hex" => request['hex']})
	end

	def getTransactions(request = {})
		return request("GET","/eth/transactions/" + (request['hash']).to_s)
	end
	
	def getErc20(request = {})
		return request("GET","/eth/erc20-tokens/" + (request['contract_address']).to_s)
	end
	
	def getErc20Balance(request = {})
		return request("GET","/eth/erc20-tokens/" + (request['contract_address']).to_s + "/" + (request['from']).to_s + "/balance")
	end
	
	def sendToAddress(request = {})
		if request["gwei"].to_s.empty?
			blockChain = getBlockChain()
			request['gwei'] = blockChain['high_gwei']
		end
		request["private_key"].to_s.empty? ? request['private_key'] = nil : request["private_key"]
		request["password"].to_s.empty? ? request['password'] = nil : request["password"]
		request["gas_limit"].to_s.empty? ? request['gas_limit'] = nil : request["gas_limit"]
		
		return request("POST","/eth/erc20-tokens/" + (request['contract_address']).to_s + "/" + (request['from']).to_s + "/transfer",{"to" => request['to'],"amount" => request['amount'],"private_key" => request['private_key'],"password" => request['password'],"gwei" => request['gwei'],"gas_limit" => request['gas_limit']})
	end

end
