require 'spec_helper'

describe PushNotifier::APNS::Connection do
  it 'stores initial content' do
    allow(File).to receive(:read).and_return('2')
    allow(Kernel).to receive(:URI).and_return('1')
    @apns = PushNotifier::APNS::Connection.new('1','2','3')
    expect(@apns.uri).to eq '1'
    expect(@apns.certificate).to eq '2'
    expect(@apns.passphrase).to eq '3'
  end
  describe 'connecting' do
    before do
      allow(File).to receive(:read).and_return('2')
      @apns = PushNotifier::APNS::Connection.new(URI('http://apple.com:2915'),'2','3')
      server = double('server').as_null_object
      cert = double('cert')
      key = double('key')
      ssl = double('ssl').as_null_object
      allow(TCPSocket).to receive(:new).and_return server
      allow(OpenSSL::X509::Certificate).to receive(:new).and_return cert
      allow(OpenSSL::SSL::SSLSocket).to receive(:new).and_return ssl
      allow(OpenSSL::SSL::SSLSocket).to receive(:connect).and_return ssl
      allow(OpenSSL::PKey::RSA).to receive(:new).and_return key
    end
    it 'opens new socket' do
      # expect(@apns.open?).to eq true
    end
    it 'should close' do
      @apns.open
      @apns.close
      expect(@apns.ssl).to eq nil
      expect(@apns.socket).to eq nil
    end
  end
end