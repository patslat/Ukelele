require_relative '../../spec_helper'

describe Twitter::PublicStream do

  describe 'default attributes' do
    it 'must have the base url set to the Twiter API endpoint' do
      expect(Twitter::PublicStream.base_uri).to eq 'https://stream.twitter.com'
    end
  end

  describe 'GET public stream' do
    before do
      VCR.insert_cassette 'public stream', :record => :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it 'records the fixture' do
      Twitter::PublicStream.get('/players/simplebits')
    end
  end

end
