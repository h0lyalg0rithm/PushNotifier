require 'socket'
require 'openssl'

module PushNotifier
  class APNS
    class Connection

      attr_reader :uri, :certificate, :passphrase, :ssl, :socket

      def initialize(uri, certificate, passphrase)
        @uri = uri
        @certificate = File.read(certificate)
        @passphrase = passphrase
      end

      def open
        @socket = TCPSocket.new(@uri.host, @uri.port)

        ssl_context = OpenSSL::SSL::SSLContext.new

        ssl_context.cert = OpenSSL::X509::Certificate.new @certificate
        ssl_context.key = OpenSSL::PKey::RSA.new @certificate, @passphrase

        @ssl = OpenSSL::SSL::SSLSocket.new @socket,ssl_context

        @ssl.connect

      end
      def write(data)
        @ssl.write(data)
      end
      def close
        @ssl.close
        @socket.close
        @ssl, @socket = nil, nil
      end
    end
  end
end