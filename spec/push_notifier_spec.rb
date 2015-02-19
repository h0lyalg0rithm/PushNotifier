require 'spec_helper'

describe PushNotifier do
 it 'test works' do
   expect(1).to eq 1
 end

  describe 'APNS' do
    it 'should exist' do
      expect(defined?(PushNotifier::APNS)).not_to eq nil
    end
  end
end