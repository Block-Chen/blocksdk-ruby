require_relative 'base'

class WebHook < Base
	
	def create(request={})
		return request("POST","/hook",{"callback"=>request['callback'],"category"=>request['category'],"address"=>request['address']})
	end

	def list(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]			
		return request("GET","/hook",{"offset"=>request['offset'],"limit"=>request['limit']})
	end
		
	def get(request={})
		return request("GET","/hook/" +    (request['hook_id']).to_s)
	end

	def delete(request={})
		return request("POST","/hook/" +    (request['hook_id']).to_s + "/delete")
	end
	
	def listResponse(request = {})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		return request("GET","/hook/response",{"offset"=>request['offset'],"limit"=>request['limit']})			
	end	
	
	def getResponse(request={})
		request["offset"].to_s.empty? ? request['offset'] = 0 : request["offset"]
		request["limit"].to_s.empty? ? request['limit'] = 10 : request["limit"]
		return request("GET","/hook/" + (request['hook_id']).to_s + "/response",{"offset"=>request['offset'],"limit"=>request['limit']})			
	end
end