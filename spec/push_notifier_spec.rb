require 'spec_helper'

#   API
#   APNS = PushNotfier::APNS.set_mode :production
#
#   @notification = PushNotifier::APNS::Notification.new token, message
#
#   APNS.send(@notification)
#   @notification.errors


describe PushNotifier::APNS do
  it 'test works' do
    expect(1).to eq 1
  end

  it 'should exist' do
    expect(defined?(PushNotifier::APNS)).not_to eq nil
  end
  it 'have initial urls' do
    expect(PushNotifier::APNS::DEVELOPMENT_URI).to match('sandbox')
        # expect(PushNotifier::APNS::DEVELOPMENT_FEEDBACK_URI).to match('feedback')
        # expect(PushNotifier::APNS::PRODUCTION_FEEDBACK_URI).to match('feedback')
    expect(PushNotifier::APNS::PRODUCTION_URI).to match('push')
  end

  describe 'sets mode' do
    it 'to production' do
      @apns = PushNotifier::APNS.set_mode :production
      expect(@apns.push_uri).to eq URI(PushNotifier::APNS::PRODUCTION_URI)
    end
    it 'to development' do
      @apns = PushNotifier::APNS.set_mode :development
      expect(@apns.push_uri).to eq URI(PushNotifier::APNS::DEVELOPMENT_URI)
    end
    it 'to development as default' do
      @apns = PushNotifier::APNS.set_mode :development
      expect(@apns.push_uri).to eq URI(PushNotifier::APNS::DEVELOPMENT_URI)
    end
    it 'return apns instance' do
      @apns = PushNotifier::APNS.set_mode :test
      expect(@apns).to be_a_kind_of PushNotifier::APNS
    end
    it 'should respond to send_notification' do
      @apns = PushNotifier::APNS.set_mode :test
      expect(@apns).to respond_to :send_notification
      expect(@apns).not_to respond_to :send_crap
    end
  end

  describe 'sends notification' do
    let(:apns){ PushNotifier::APNS.set_mode :production }
    it 'in production' do
      # expect(@apns.send.response).to eq :success
    end
  end

end


