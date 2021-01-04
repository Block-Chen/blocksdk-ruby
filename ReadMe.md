# BLOCKSDK for Ruby

[![Gem Version](https://badge.fury.io/rb/blocksdk.svg)](https://badge.fury.io/rb/blocksdk)

## SDK Documentation
[ Our BlockSDK-RUBY Page ](https://docs.blocksdk.com/) includes all the documentation related to RUBY SDK. Sample Codes, to Releases. Here are few quick links to get you there faster.
* [ BlockSDK Developer Docs]


## Installation

The BLOCKSDK for Ruby is available from RubyGems.
should pick the specific AWS service gems to install.

```ruby
gem install blocksdk
```

## Quick Examples
### Create an Bitcoin client
```ruby
blockSDK = BlockSDK.new('YOU TOKEN')
btcClient = blockSDK.createBitcoin()
```
### Get Address info
```ruby
addressInfo = btcClient.getAddressInfo({
    "address" => "18cBEMRxXHqzWWCxZNtU91F5sbUNKhL5PX",
    "rawtx" => true,
    "reverse" => true,
    "offset" => 0,
    "limit" => 10
})

puts addressInfo
```

### Create an Bitcoin Wallet
```ruby
wallet = btcClient.createWallet({
    "name" : "test"
})
```

[BlockSDK Developer Docs]: https://docs.blocksdk.com
