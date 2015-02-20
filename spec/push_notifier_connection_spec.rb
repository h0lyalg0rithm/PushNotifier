require 'spec_helper'
require 'push_notifier/apns/core'


# describe PushNotifier do
  describe 'APNS' do

    let(:uri){ PushNotifier::APNS::DEVELOPER_URL }

    describe 'Connection' do
      it 'should have uri' do
        raise PushNotifier::APNS::DEVELOPER_URL.to_s
        @connection = PushNotifier::APNS::Connection.new(uri,nil,nil)
        expect(@connection.uri).to eq URI(PushNotifier::APNS::DEVELOPER_URL)
      end
    end
  end
# end