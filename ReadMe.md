# AWS SDK for Ruby - Version 3

[![Gem Version](https://badge.fury.io/rb/blocksdk.svg)](https://badge.fury.io/rb/blocksdk) [![Build Status](https://travis-ci.org/aws/aws-sdk-ruby.svg?branch=master)](https://travis-ci.org/aws/aws-sdk-ruby) [![Github forks](https://img.shields.io/github/forks/aws/aws-sdk-ruby.svg)](https://github.com/aws/aws-sdk-ruby/network)
[![Github stars](https://img.shields.io/github/stars/aws/aws-sdk-ruby.svg)](https://github.com/aws/aws-sdk-ruby/stargazers)
[![Gitter](https://badges.gitter.im/aws/aws-sdk-ruby.svg)](https://gitter.im/aws/aws-sdk-ruby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## Links of Interest

* [API Documentation](https://docs.aws.amazon.com/sdk-for-ruby/v3/api/index.html)
* [Developer Guide](https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/welcome.html)
* [V3 Upgrading Guide](https://github.com/aws/aws-sdk-ruby/blob/master/V3_UPGRADING_GUIDE.md)
* [AWS Developer Blog](https://aws.amazon.com/blogs/developer/category/programing-language/ruby/)

## Installation

The AWS SDK for Ruby is available from RubyGems. With V3 modularization, you
should pick the specific AWS service gems to install.

```ruby
gem 'aws-sdk-s3', '~> 1'
gem 'aws-sdk-ec2', '~> 1'
```

Alternatively, the `aws-sdk` gem contains every available AWS service gem. This
gem is very large; it is recommended to use it only as a quick way to migrate
from V2 or if you depend on many AWS services.

```ruby
gem 'aws-sdk', '~> 3'
```

**Please use a pessimistic version constraint on the major version when
depending on service gems.**
