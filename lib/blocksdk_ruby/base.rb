require 'httparty'
require 'json'

class Base
	
	attr_accessor :api_token
	def initialize(api_token)
		@api_token = api_token
	end
	
	def listPrice(request = {})
		return request("GET","/price")
	end

	def getHashType(request = {})
		return request("GET","/auto/" + request['hash'] + "/type") 
	end

	def getUsage(request = {})

		if request["start_date"].to_s.empty?
			d = Time.now - 604800
			request['start_date'] = d.strftime("%Y-%m-%d")
		end

		if request["end_date"].to_s.empty?
			d = Time.now
			request['end_date'] = d.strftime("%Y-%m-%d")
		end

		return request("GET","/usage",{"start_date"=> request['start_date'],"end_date"=> request['end_date']})
	end


	def request(method,path,data = {})
		url = "https://api.blocksdk.com/v1" + path 
		if method == "GET" and data.size > 0
			url += "?"
			data.each do |key, value|
				if value == true	 
					url += key + "=true&"
				elsif value == false
					url += key + "=false&"
				else
					url += key+ "=" + value.to_s + "&"
				end
			end
		end

		if method == "POST"
			response = HTTParty.post(url, :data => data, :headers => { 'Content-Type': 'application/json','x-api-key': @api_token})	
		else
			response = HTTParty.get(url,:headers => { 'Content-Type': 'application/json','x-api-key': @api_token})	
		end

		header_dict = response.headers
		body = JSON.parse(response.body)

		header_dict["statusCode"] = response.code

		begin
			body["HTTP_HEADER"] = header_dict
		rescue
			body_dict = {}
			for i in 0..(body.length - 1)
				ind = i.to_s
				body_dict[ind] = body[i]
			end
			body = body_dict
			body["HTTP_HEADER".to_s] = header_dict
		end
		
		return body	
	end

end

#baseInstance = Base.new("ad38QFTevz8fEEAG4fKsf4T5L8pwqgcy6LXMHpqU")
#puts baseInstance.listPrice()
#puts baseInstance.getHashType({'hash'=>'000000000000000089d2938df30be807844feea4c3340ad32873bb1b692b7f1a'})
#puts baseInstance.getUsage({})