require_relative 'base'

class Litecoin < Base
	def getBlockChain(request = {})
		return request("GET","/ltc/info")
	end
	def getBlock(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/ltc/blocks/"+ (request['block']).to_s, {
			"rawtx" => request['rawtx'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getMemPool(request = {})
		request["rawtx"].to_s.empty? ? request['rawtx'] = false : request['rawtx']
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/ltc/mempool",{
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
		
		return request("GET","/ltc/addresses/" + (request['address']).to_s,{
			"reverse" => request['reverse'],
			"rawtx" => request['rawtx'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getAddressBalance(request = {})
		return request("GET","/ltc/addresses/" + (request['address']).to_s + "/balance")
	end

	def getWallets(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/ltc/wallets",{
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end
	
	def getWallet(request = {})
		return request("GET","/ltc/wallets/"+     (request['wallet_id']).to_s + "")
	end
	
	def createHdWallet(request = {})
		request["limit"].to_s.empty? ? request['limit'] = nil : request["limit"]
		return request("POST","/ltc/wallets/hd",{
			"name" => request['name']
		})
	end

	def loadWallet(request = {})
		return request("POST","/ltc/wallets/"+ (request['wallet_id']).to_s + "/load",{
			"wif" => request['wif'],
			"password" => request['password']
		})
	end

	def unloadWallet(request = {})
		return request("POST","/ltc/wallets/"+(request['wallet_id']).to_s + "/unload")
	end

	def getWalletAddress(request = {})
		request["address"].to_s.empty? ? request['address'] = nil : request["address"]
		request["hdkeypath"].to_s.empty? ? request['hdkeypath'] = nil : request["hdkeypath"]
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		
		return request("GET","/ltc/wallets/"+(request['wallet_id']).to_s + "/addresses",{
			"address" => request['address'],
			"hdkeypath" => request['hdkeypath'],
			"offset" => request['offset'],
			"limit" => request['limit']
		})
	end

	def createWalletAddress(request = {})

		request["wif"].to_s.empty? ? request['wif'] = nil : request["wif"]
		request["password"].to_s.empty? ? request['password'] = nil : request["password"]
		
		return request("POST","/ltc/wallets/"+(request['wallet_id']).to_s + "/addresses",{
			"wif" => request['wif'],
			"password" => request['password']
		})
	end

	def getWalletBalance(request = {})	
		return request("GET","/ltc/wallets/"+(request['wallet_id']).to_s + "/balance")		
	end

	def getWalletTransactions(request = {})

		request["order"].to_s.empty? ? request['order'] = 'desc' : request["order"]
		request["type"].to_s.empty? ? request['type'] = 'all' : request["type"]
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]

		return request("GET","/ltc/wallets/"+(request['wallet_id']).to_s + "/transaction",{
			"type" => request['type'],
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
		
		request["wif"].to_s.empty? ? request['wif'] = nil : request["wif"]
		request["password"].to_s.empty? ? request['password'] = nil : request["password"]
		request["subtractfeefromamount"].to_s.empty? ? request['subtractfeefromamount'] = false : request['subtractfeefromamount']
		
		return request("POST","/ltc/wallets/"+     (request['wallet_id']).to_s + "/sendtoaddress",{
			"address" => request['address'],
			"amount" => request['amount'],
			"wif" => request['wif'],
			"password" => request['password'],
			"kbfee" => request['kbfee'],
			"subtractfeefromamount" => request['subtractfeefromamount']
		})
	end

	def sendMany(request = {})
		
		request["wif"].to_s.empty? ? request['wif'] = nil : request["wif"]
		request["password"].to_s.empty? ? request['password'] = nil : request["password"]
		request["subtractfeefromamount"].to_s.empty? ? request['subtractfeefromamount'] = false : request['subtractfeefromamount']
		
		return request("POST","/ltc/wallets/"+     (request['wallet_id']).to_s + "/sendmany",{
			"to" => request['to'],
			"wif" => request['wif'],
			"password" => request['password'],
			"subtractfeefromamount" => request['subtractfeefromamount']
		})
	end

	def sendTransaction(request = {})
		return request("POST","/ltc/transactions/send",{
			"hex" => request['hex']
		})
	end

	def getTransaction(request = {})
		return request("GET","/ltc/transactions/"+     (request['hash']).to_s + "")
	end
end
