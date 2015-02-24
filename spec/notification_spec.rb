require 'spec_helper'

describe PushNotifier::APNS::Notification do
  it 'sets default value ' do
    @apns = PushNotifier::APNS::Notification.new '1234','message'
    expect(@apns.data_message).to eq 1
  end
  it 'cleans device token' do
    @apns = PushNotifier::APNS::Notification.new '1234', 'message'
    expect(@apns.alert).to eq 'message'
  end
  it 'saves other info as custom data' do
    @apns = PushNotifier::APNS::Notification.new '1234', 'message', data: 'test', sound: true
    expect(@apns.custom_data[:data]).to eq 'test'
    expect(@apns.custom_data[:sound]).to eq nil
  end
  it 'creats message data' do
    @apns = PushNotifier::APNS::Notification.new '1234', 'message', data: 'test', sound: true
    expect(JSON.parse(@apns.data_message)["aps"]["sound"]).to eq true
  end
end

