require 'uri'

module PushNotifier
  class APNS
    attr_reader :push_uri
    attr_accessor :certificate, :passphrase

    DEVELOPMENT_URI = 'tcp://gateway.sandbox.push.apple.com:2195'

    PRODUCTION_URI = 'tcp://gateway.push.apple.com:2195'

    def self.set_mode(environment)
      case environment
        when :production
          uri = PRODUCTION_URI
        else
          uri = DEVELOPMENT_URI
      end
      @apns = self.new(uri)
    end

    def initialize(push_uri)
      @push_uri = URI(push_uri)
    end

    def send_notification(notification)
      bytes = ''
      self.setup_connection do
        payload = notification.payload
        @connection.write(payload)
      end
    end

    def setup_connection
      @connection = Connection.new(@push_uri, @certificate, @passphrase)
      @connection.open
      yield if block_given?
      @connection.close
    end

  end
end