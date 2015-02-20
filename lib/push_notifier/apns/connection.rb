require 'openssl'
require 'uri'

module PushNotifier
  module APNS
    class Connection
      attr_accessor :uri
      def initialize(uri,certification,passphrase=nil)
        @uri = URI(uri)
        @certificate = certification
        @passphrase = passphrase
      end
    end
  end
end