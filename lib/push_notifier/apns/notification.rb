require 'json'

module PushNotifier
  class APNS
    class Notification
      attr_accessor :options, :token
      def initialize(token, message, options={})
        default_options
        dynamic_accessor options
        @token = clean_token token
        @alert = message
        @custom_data = options.reject { |x,y| allowed_attrs.include? x }
      end

      def default_options
        @alert = ''
      end

      def clean_token(token)
        [token.gsub!(/[<|>|\s]/,'')].pack('H*')
      end

      def data_message
        aps = allowed_attrs.inject({}) do |acc,x|
          acc[x.to_s] = self.send(x) unless self.send(x).nil?
          acc
        end
        custom_data = aps.delete('custom_data')
        custom_data[:aps] = aps
        custom_data.to_json.gsub(/\\u([\da-fA-F]{4})/) {|m| [$1].pack("H*").unpack("n*").pack("U*")}
      end

      def allowed_attrs
        [:alert, :badge, :category, :content_available, :sound, :custom_data, :priority]
      end

      def dynamic_accessor(option)
        allowed_attrs.each do |x|
          singleton_class.class_eval do; attr_accessor "#{x}"; end
          self.send("#{x}=",option[x])
        end
      end
      def payload
        dm = data_message
        [0, 0, 32, @token, 0, dm.bytesize, dm].pack("ccca*cca*")
      end
    end
  end
end