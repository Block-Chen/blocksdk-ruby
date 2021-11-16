require_relative 'base'

class BinanceSmart < Base
	def getBlockChain(request = {})
		return request("GET","/bsc/info")		
	end

	def getBlock(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]

		return request("GET","/bsc/blocks/" + (request['block']).to_s,{"rawtx" => request['rawtx'],"offset" => request['offset'],"limit" => request['limit']})
	end

	def getMemPool(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/mempool",{"rawtx" => request['rawtx'],"offset" => request['offset'],"limit" => request['limit']})
	end
	
	def getAddress(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/addresses",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end

	def loadAddress(request = {})
		return request("POST","/bsc/addresses/" + (request['address']).to_s + "/load",{"private_key" => request['private_key'],"password" => request['password']})
	end

	def unloadAddress(request = {})
		return request("POST","/bsc/addresses/" + (request['address']).to_s + "/unload")
	end

	def createAddress(request = {})
		request["name"].to_s.empty? ? request['name'] = 0 : request["name"]
		return request("POST","/bsc/addresses",{"name" => request['name']})
	end
	
	def getAddressInfo(request = {})

		request["reverse"].to_s.empty? ? request['reverse'] = true : request['reverse']
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/addresses/" + (request['address']).to_s ,{"reverse" => request['reverse'],"rawtx" => request['rawtx'],"offset" => request['offset'],"limit" => request['limit']})
	end
	
	def getAddressBalance(request = {})
		return request("GET","/bsc/addresses/" + (request['address']).to_s + "/balance")
	end

	def sendToAddress(request = {})
		if request["gwei"].to_s.empty?
			blockChain = getBlockChain()
			request['gwei'] = blockChain['medium_gwei']
		end
		request["private_key"].to_s.empty? ? request['private_key'] = nil : request["private_key"]
		request["password"].to_s.empty? ? request['password'] = nil : request["password"]
		request["gas_limit"].to_s.empty? ? request['gas_limit'] = nil : request["gas_limit"]
		
		return request("POST","/bsc/addresses/" + (request['from']).to_s + "/sendtoaddress",{"to" => request['to'],"amount" => request['amount'],"private_key" => request['private_key'],"password" => request['password'],"gwei" => request['gwei'],"gas_limit" => request['gas_limit']})
	end
	
	def sendTransaction(request = {})
		return request("POST","/bsc/transactions/send",{"hex" => request['hex']})
	end

	def getTransactions(request = {})
		return request("GET","/bsc/transactions/" + (request['hash']).to_s)
	end
	
	def getBep20(request = {})
		return request("GET","/bsc/bep20-tokens/" + (request['contract_address']).to_s)
	end
	
	def getBep20Balance(request = {})
		return request("GET","/bsc/bep20-tokens/" + (request['contract_address']).to_s + "/" + (request['from']).to_s + "/balance")
	end
	
	def getBep20Transfer(request = {})
		if request["gwei"].to_s.empty?
			blockChain = getBlockChain()
			request['gwei'] = blockChain['high_gwei']
		end
		request["private_key"].to_s.empty? ? request['private_key'] = nil : request["private_key"]
		request["password"].to_s.empty? ? request['password'] = nil : request["password"]
		request["gas_limit"].to_s.empty? ? request['gas_limit'] = nil : request["gas_limit"]
		
		return request("POST","/bsc/bep20-tokens/" + (request['contract_address']).to_s + "/" + (request['from']).to_s + "/transfer",{"to" => request['to'],"amount" => request['amount'],"private_key" => request['private_key'],"password" => request['password'],"gwei" => request['gwei'],"gas_limit" => request['gas_limit']})
	end
	
	def getNfts(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep721-tokens/" + (request['contract_address']).to_s + "/tokens",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getOwnerNfts(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep721-tokens/" + (request['contract_address']).to_s + "/" + (request['owner_address']).to_s + "/owner",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getCreatorNfts(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep721-tokens/" + (request['contract_address']).to_s + "/" + (request['creator_address']).to_s + "/creator",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getAuctionNfts(request = {})
		request["order_by"].to_s.empty? ? request['order_by'] = 'end_time' : request["order_by"]
		request["order_direction"].to_s.empty? ? request['order_direction'] = 'desc' : request["order_direction"]
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep721-tokens/" + (request['contract_address']).to_s + "/auction",{
			"order_by" => request['order_by'],
			"order_direction" => request['order_direction'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getSaleNfts(request = {})
		request["order_direction"].to_s.empty? ? request['order_direction'] = 'desc' : request["order_direction"]
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep721-tokens/" + (request['contract_address']).to_s + "/" + (request['seller_address']).to_s + "/sale",{
			"order_direction" => request['order_direction'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getNftBids(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = 0 : request["rawtx"]
		request["order_direction"].to_s.empty? ? request['order_direction'] = 'desc' : request["order_direction"]
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep721-tokens/" + (request['contract_address']).to_s + "/" + (request['token_id']).to_s + "/bid",{
			"rawtx" => request['rawtx'],
			"order_direction" => request['order_direction'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getNftInfo(request = {})		
		return request("GET","/bsc/bep721-tokens/" + (request['contract_address']).to_s + "/" + (request['token_id']).to_s + "/info")
	end
	
	def getNftTransfers(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = 0 : request["rawtx"]
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep721-tokens/" + (request['contract_address']).to_s + "/" + (request['token_id']).to_s + "/bid",{
			"rawtx" => request['rawtx'],
			"order_direction" => request['order_direction'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getMultiNft(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep1155-tokens/" + (request['contract_address']).to_s + "/tokens",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getMultiNftOwnerList(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep1155-tokens/" + (request['contract_address']).to_s + "/" + (request['token_id']).to_s + "/list",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getMultiNftContractOwner(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep1155-tokens/" + (request['contract_address']).to_s + "/" + (request['owner_address']).to_s + "/owners",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getMultiNftOwner(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep1155-tokens/" + (request['owner_address']).to_s + "/owner",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getMultiNftContractCreator(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep1155-tokens/" + (request['contract_address']).to_s + "/" + (request['creator_address']).to_s + "/creators",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getMultiNftCreator(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep1155-tokens/" + (request['creator_address']).to_s + "/creator",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getMultiNftInfo(request = {})
		return request("GET","/bsc/bep1155-tokens/" + (request['contract_address']).to_s + "/" + (request['token_id']).to_s + "/info",{
		})
	end
	
	def getMultiNftTransfers(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = 0 : request["rawtx"]
	
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep1155-tokens/" + (request['contract_address']).to_s + "/" + (request['token_id']).to_s + "/transfers",{
			"rawtx" => request['rawtx'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getMultiSaleNfts(request = {})
		request["order_direction"].to_s.empty? ? request['order_direction'] = 'desc' : request["order_direction"]
	
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/bsc/bep1155-tokens/" + (request['contract_address']).to_s + "/" + (request['seller_address']).to_s + "/sale",{
			"order_direction" => request['order_direction'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getContractRead(request = {})
		request["parameter_type"].to_s.empty? ? request['parameter_type'] = nil : request["parameter_type"]
		request["parameter_data"].to_s.empty? ? request['parameter_data'] = nil : request["parameter_data"]
		
		return request("POST","/bsc/contracts/" + (request['contract_address']).to_s + "/read",{
			"method" => request['method'],
			"return_type" => request['return_type'],
			"parameter_type" => request['parameter_type'],
			"parameter_data" => request['parameter_data']
		})
	end
	
	def getContractWrite(request = {})
		request["private_key"].to_s.empty? ? request['private_key'] = nil : request["private_key"]
		request["password"].to_s.empty? ? request['password'] = nil : request["password"]
		request["gas_limit"].to_s.empty? ? request['gas_limit'] = nil : request["gas_limit"]
		
		request["parameter_type"].to_s.empty? ? request['parameter_type'] = nil : request["parameter_type"]
		request["parameter_data"].to_s.empty? ? request['parameter_data'] = nil : request["parameter_data"]
		
		return request("POST","/bsc/contracts/" + (request['contract_address']).to_s + "/write",{
			"method" => request['method'],
			"return_type" => request['return_type'],
			"parameter_type" => request['parameter_type'],
			"parameter_data" => request['parameter_data'],
			"from" => request['from'],
			"private_key" => request['private_key'],
			"password" => request['password'],
			"amount" => request['amount'],
			"gas_limit" => request['gas_limit']
		})
	end
	
	def getContractWriteFees(request = {})
		request["gas_limit"].to_s.empty? ? request['gas_limit'] = nil : request["gas_limit"]
		
		request["parameter_type"].to_s.empty? ? request['parameter_type'] = nil : request["parameter_type"]
		request["parameter_data"].to_s.empty? ? request['parameter_data'] = nil : request["parameter_data"]
		
		return request("POST","/bsc/contracts/" + (request['contract_address']).to_s + "/write/fees",{
			"method" => request['method'],
			"return_type" => request['return_type'],
			"parameter_type" => request['parameter_type'],
			"parameter_data" => request['parameter_data'],
			"from" => request['from'],
			"amount" => request['amount'],
			"gas_limit" => request['gas_limit']
		})
	end

end
