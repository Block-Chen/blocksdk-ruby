require_relative 'blocksdk'

blockSDK = BlockSDK.new('YOU TOKEN')

# btcClient = blockSDK.createBitcoin()
# output = btcClient.getBlockChain()

#dashClient = blockSDK.createDash()
# output = dashClient.getTransaction({    "hash" => "fa6c191a429d65552b9f0a572e24d8edbfb5e08ab4c41afc1914e60d14be14fc"})

# ethereumClient = blockSDK.createEthereum()
# output = ethereumClient.getBlockChain()

# xmrClient = blockSDK.createMonero()
# output = xmrClient.getBlockChain()

# webhookClient = blockSDK.createWebHook()
# output = webhookClient.list()

# output = blockSDK.listPrice()

# bchClient = blockSDK.createBitcoinCash()
# output = bchClient.getBlockChain()

ltcClient = blockSDK.createLitecoin()
output = ltcClient.getBlockChain()

puts output
