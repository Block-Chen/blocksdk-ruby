require_relative 'base'
require_relative 'dash'
require_relative 'bitcoin'
require_relative 'ethereum'
require_relative 'bitcoincash'
require_relative 'monero'
require_relative 'webhook'
require_relative 'litecoin'
require_relative 'market'
require_relative 'token'
require_relative 'tool'

class BlockSDK < Base
	attr_accessor :api_token
	
	def initialize(api_token)
		@api_token = api_token
	end

	def createBitcoin()
		return Bitcoin.new(@api_token)
	end

	def createEthereum()
		return Ethereum.new(@api_token)
	end

	def createLitecoin()
		return Litecoin.new(@api_token)
	end

	def createMonero()
		return Monero.new(@api_token)
	end

	def createWebHook()
		return WebHook.new(@api_token)
	end

	def createDash()
		return Dash.new(@api_token)
	end

	def createBitcoinCash()
		return BitcoinCash.new(@api_token)
	end
	
	def createMarket()
		return Market.new(@api_token)
	end
	
	def createToken()
		return Token.new(@api_token)
	end
	
	def createTool()
		return Tool.new(@api_token)
	end
end
