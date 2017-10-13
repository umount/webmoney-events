require 'spec_helper'

describe 'WebmoneyEvents API' do
  let(:events) {
    WebmoneyEvents.new(
      access_token: Settings.events.access_token,
    )
  }

  it 'initial configuration' do
    expect(events.configure).to include(:access_token)

    expect(events.configure[:access_token]).to eq(Settings.events.access_token)
  end

  it 'autoload requests class' do
    expect(events.feed.config).to include(:access_token)
  end

  describe 'Feed requests' do
    it 'get without params' do
      response = events.feed.get

      expect(response['feed'].count).to be > 1
    end
  end

  describe 'Universal request api' do
    it 'unhandled response' do
      response = events.api_request(get: 'Feed/New').request

      expect(response).to be_a_kind_of(String)
    end

    it 'parse json response' do
      response = events.api_request(get: 'Feed/New').response

      expect(response).to be_a_kind_of(Array)
    end
  end
end
