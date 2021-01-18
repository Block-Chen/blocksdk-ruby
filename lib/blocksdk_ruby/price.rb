require_relative 'base'

class Token < Base
	def getUsages(request = {})		
		return request("GET","/token/usage",{
			"stat_date" => request['stat_date'],
			"end_date" => request['end_date']
		})
	end
end
