require_relative 'base'

class Market < Base
  def getBlockChain(request = {})
		return request("GET","/market/exchanges")
	end

	def getTrades(request = {})
		request["from"].to_s.empty? ? request['from'] = nil : request['from']
		request["to"].to_s.empty? ? request['to'] = "USD" : request["to"]

		return request("GET","/market/trades",{
			"from" => request['from'],
			"to" => request['to']
		})
	end
  
  def getRates(request = {})

		return request("GET","/market/rates/" +    (request['from']).to_s+ "",{
			"to" => request['to'],
			"from_amount" => request['from_amount']
		})
	end
  
  def getExchangeTrades(request = {})
		request["from"].to_s.empty? ? request['from'] = nil : request['from']
		request["to"].to_s.empty? ? request['to'] = "USD" : request["to"]

		return request("GET","/market/trades/" +    (request['exchage_id']).to_s+ "",{
			"from" => request['from'],
			"to" => request['to']
		})
	end
  
  def getExchangeRates(request = {})
		request["to"].to_s.empty? ? request['to'] = "USD" : request["to"]

		return request("GET","/market/rates/" +    (request['exchage_id']).to_s + "/" + (request['from']).to_s,{
			"to" => request['to'],
			"from_amount" => request['from_amount']
		})
	end
  
end
