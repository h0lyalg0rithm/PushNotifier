require 'spec_helper'

describe PushNotifier do
 it 'test works' do
   expect(1).to eq 1
 end

  describe 'APNS' do
    it 'should exist' do
      expect(defined?(PushNotifier::APNS)).not_to eq nil
    end
    it 'have initial urls' do
      expect(PushNotifier::APNS::DEVELOPMENT_URL).to match('sandbox')
      expect(PushNotifier::APNS::DEVELOPMENT_FEEDBACK_URL).to match('feedback')
      expect(PushNotifier::APNS::PRODUCTION_FEEDBACK_URL).to match('feedback')
      expect(PushNotifier::APNS::PRODUCTION_URL).to match('push')
    end
  end
end