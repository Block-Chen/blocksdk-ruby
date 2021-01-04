# BLOCKSDK for Ruby

[![Gem Version](https://badge.fury.io/rb/blocksdk.svg)](https://badge.fury.io/rb/blocksdk)

## Links of Interest

* [API Documentation](https://docs.blocksdk.com)

## Installation

The AWS SDK for Ruby is available from RubyGems. With V3 modularization, you
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
