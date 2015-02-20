module PushNotifier
  module APNS
    DEVELOPMENT_URL = 'tcp://gateway.sandbox.push.apple.com:2195'
    DEVELOPMENT_FEEDBACK_URL = 'tcp://feedback.sandbox.push.apple.com:2195'

    PRODUCTION_FEEDBACK_URL = 'tcp://feedback.push.apple.com:2195'
    PRODUCTION_URL = 'tcp://gateway.push.apple.com:2195'

    def self.set_mode(environment)
      case environment
        when :production
          url = PRODUCTION_URL
          feedback_url = PRODUCTION_FEEDBACK_URL
        else
          url = DEVELOPMENT_URL
          feedback_url = DEVELOPMENT_FEEDBACK_URL
      end
    end

    class << self
      attr_accessor :pem, :pass
    end

    def self.send_message(device_token,message,extra={})
      raise 'Device Token is required' unless device_token
    end

  end
end