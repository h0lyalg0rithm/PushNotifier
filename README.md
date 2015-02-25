# PushNotifier
[![Build Status](https://travis-ci.org/h0lyalg0rithm/PushNotifier.svg)](https://travis-ci.org/h0lyalg0rithm/PushNotifier)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'push_notifier'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install push_notifier

## Usage
```
APNS = PushNotifier::APNS.set_mode :production

APNS.certificate = 'certificate.pem'
APNS.passphrase = 'passphrase' #If you have pasword protected the certiicate 

notification = PushNotifier::APNS::Notification.new '<device_token>', 'message'

APNS.send_message notification

```

## Contributing

1. Fork it ( https://github.com/h0lyalg0rithm/push_notifier/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
