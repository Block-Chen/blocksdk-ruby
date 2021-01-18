require_relative 'base'

class Tool < Base
	def getTransaction(request = {})		
		return getHashType("GET","/tools/hash-type/" + (request['hash']).to_s+ "")
	end
end
