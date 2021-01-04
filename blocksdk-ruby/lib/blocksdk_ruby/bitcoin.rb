require_relative 'base'

class Bitcoin < Base
	def getBlockChain(request = {})
		return request("GET","/btc/block")
	end
	def getBlock(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/btc/block/"+ (request['block']).to_s, {
			"rawtx" => request['rawtx'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getMemPool(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/btc/mempool",{
			"rawtx" => request['rawtx'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getAddressInfo(request = {})

		request["reverse"].to_s.empty? ? request['reverse'] = true : request["reverse"]
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/btc/address/" + (request['address']).to_s,{
			"reverse" => request['reverse'],
			"rawtx" => request['rawtx'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getAddressBalance(request = {})
		return request("GET","/btc/address/" + (request['address']).to_s + "/balance")
	end

	def listWallet(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/btc/wallet",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def createWallet(request = {})
		request["limit"].to_s.empty? ? request['limit'] = nil : request["limit"]
		return request("POST","/btc/wallet",{
			"name" => request['name']
		})
	end

	def loadWallet(request = {})
		return request("POST","/btc/wallet/"+ (request['wallet_id']).to_s + "/load",{
			"seed_wif" => request['seed_wif'],
			"password" => request['password']
		})
	end

	def unLoadWallet(request = {})
		return request("POST","/btc/wallet/"+(request['wallet_id']).to_s + "/unload")
	end

	def listWalletAddress(request = {})
		request["address"].to_s.empty? ? request['address'] = nil : request["address"]
		request["hdkeypath"].to_s.empty? ? request['hdkeypath'] = nil : request["hdkeypath"]
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/btc/wallet/"+(request['wallet_id']).to_s + "/address",{
			"address" => request['address'],
			"hdkeypath" => request['hdkeypath'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end

	def createWalletAddress(request = {})

		request["seed_wif"].to_s.empty? ? request['seed_wif'] = nil : request["seed_wif"]
		request["password"].to_s.empty? ? request['password'] = nil : request["password"]
		
		return request("POST","/btc/wallet/"+(request['wallet_id']).to_s + "/address",{
			"seed_wif" => request['seed_wif'],
			"password" => request['password']
		})
	end

	def getWalletBalance(request = {})	
		return request("GET","/btc/wallet/"+(request['wallet_id']).to_s + "/balance")		
	end

	def getWalletTransaction(request = {})

		request["order"].to_s.empty? ? request['order'] = 'desc' : request["order"]
		request["category"].to_s.empty? ? request['category'] = 'all' : request["category"]
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]

		return request("GET","/btc/wallet/"+(request['wallet_id']).to_s + "/transaction",{
			"category" => request['category'],
			"order" => request['order'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end

	def sendToAddress(request = {})

		if request["kbfee"].to_s.empty?
			blockChain = getBlockChain()
			request['kbfee'] = blockChain['medium_fee_per_kb']
		end
		
		request["seed_wif"].to_s.empty? ? request['seed_wif'] = nil : request["seed_wif"]
		request["password"].to_s.empty? ? request['password'] = nil : request["password"]
		
		return request("POST","/btc/wallet/"+     (request['wallet_id']).to_s + "/sendtoaddress",{
			"address" => request['address'],
			"amount" => request['amount'],
			"seed_wif" => request['seed_wif'],
			"password" => request['password'],
			"kbfee" => request['kbfee']
		})
	end

	def sendMany(request = {})
		
		request["seed_wif"].to_s.empty? ? request['seed_wif'] = nil : request["seed_wif"]
		request["password"].to_s.empty? ? request['password'] = nil : request["password"]
		
		return request("POST","/btc/wallet/"+     (request['wallet_id']).to_s + "/sendmany",{
			"to" => request['to'],
			"seed_wif" => request['seed_wif'],
			"password" => request['password']
		})
	end

	def sendTransaction(request = {})
		return request("POST","/btc/transaction",{
			"sign_hex" => request['sign_hex']
		})
	end

	def getTransaction(request = {})
		return request("GET","/btc/transaction/"+     (request['hash']).to_s + "")
	end

	def getTransactionTracking(request = {})		
		return request("GET","/btc/transaction/"+     (request['hash']).to_s + "/tracking")
	end
end