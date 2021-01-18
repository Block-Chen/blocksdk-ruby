require_relative 'base'

class WebHook < Base
	
	def create(request={})
		return request("POST","/hooks",{"callback_url"=>request['callback_url'],"symbol"=>request['symbol'],"address"=>request['address']})
	end

	def list(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]			
		return request("GET","/hooks",{"offset"=>request['offset'],"limit"=>request['limit']})
	end
		
	def get(request={})
		return request("GET","/hooks/" +    (request['hook_id']).to_s)
	end

	def delete(request={})
		return request("DELETE","/hooks/" +    (request['hook_id']).to_s)
	end
	
	def getResponses(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		return request("GET","/hooks/responses",{"offset"=>request['offset'],"limit"=>request['limit']})			
	end	
	
	def getHookResponses(request={})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		return request("GET","/hooks/" + (request['hook_id']).to_s + "/responses",{"offset"=>request['offset'],"limit"=>request['limit']})			
	end
end
