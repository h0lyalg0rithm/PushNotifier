require 'json'

module PushNotifier
  class APNS
    class Notification
      def initialize(token, message, *options)
        @device_token = clean_token token
        # @options = default_options.merge(options)
      end
      def default_options
        {
            alert: 'true',
            badge: 1,
            sound: 'default',
            priority: 5
        }
      end
      def clean_token(token)
        [token.gsub!(/[<|>|\s]/,'')].pack('H*')
      end
      def data_message
        aps = {'aps'=> {} }
        aps['aps']['alert'] = 'test'
        aps['aps']['badge'] = 1
        aps['aps']['sound'] = true
        aps.to_json.gsub(/\\u([\da-fA-F]{4})/) {|m| [$1].pack("H*").unpack("n*").pack("U*")}
      end
      def frame_data
        # [@device_token]
      end
      def payload
        dm = data_message
        [0, 0, 32, @device_token, 0, dm.bytesize, dm].pack("ccca*cca*")
      end
    end
  end
end