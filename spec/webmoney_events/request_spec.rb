require 'spec_helper'

describe 'WebmoneyEvents API' do
  let(:events) {
    WebmoneyEvents.new(
      access_token: Settings.events.access_token,
      #api_url: 'http://localhost:8080'
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

  describe 'Group requests' do
    # https://events-api.webmoney.ru/Help/Api/POST-Group-CreateRegular
    it 'create new public group' do
      allow_any_instance_of(
        WebmoneyEvents::Requests::Group
      ).to receive(:response).and_return({
        "uid"=>"dc5d554c-2b3d-48fe-8a7d-a76c7deceb7e"
      })

      # visibility: public | private | secret | wmpublic
      response = events.group.create(
        name: 'Test public group',
        desc: 'Description',
        visibility: 'public'
      )

      expect(response).to include('uid')
    end

    # https://events-api.webmoney.ru/Help/Api/GET-Group-Info_groupUid
    it 'get group info' do
      response = events.group.info('31c64237-232d-489f-800c-5f75c98e31ac')
      expect(response['uid']).to eq('31c64237-232d-489f-800c-5f75c98e31ac')
    end

    # https://events-api.webmoney.ru/Help/Api/POST-Event-Hide
    it 'hide group' do
      expect {
        events.group.hide('31c64237-232d-489f-800c-5f75c98e31ac')
      }.not_to raise_error
    end

    # https://events-api.webmoney.ru/Help/Api/POST-Group-Leave
    it 'leave group' do
      expect {
        events.group.leave('dc5d554c-2b3d-48fe-8a7d-a76c7deceb7e')
      }.not_to raise_error
    end

    # https://events-api.webmoney.ru/Help/Api/POST-Group-CreateBusiness
    it 'create business group' do
      allow_any_instance_of(
        WebmoneyEvents::Requests::Group
      ).to receive(:response).and_return({
        "uid"=>"a449bb54-ed78-4cd1-a16e-ed6f2a580216"
      })

      response = events.group.create_business(
        name: 'Test business group',
        desc: 'Description',
      )

      expect(response).to include('uid')
    end
  end

  describe 'Event requests' do
    it 'create new event post' do
      response = events.event.create(
        group: 'a449bb54-ed78-4cd1-a16e-ed6f2a580216',
        text: 'This is a new, automatically generated event text'
      )

      expect(response).to include('id')
    end
  end

  # https://events-api.webmoney.ru/Help/Api/POST-WidgetComments-Create
  # https://events-api.webmoney.ru/Help/Api/POST-WidgetComments-CreateForEvent
  describe 'Widget Comments requests' do
    it 'create for event' do
      response = events.widget.create(
        event: 252102785,
        url: 'https://news.dev.local',
        branches: 'tree',
        design: 'light'
      )

      expect(response['ident']).to include('uid')
    end
  end
end
