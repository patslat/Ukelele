require 'spec_helper'
require 'rake'

describe 'twitter namespace rake task' do
  before :all do
    Rake.application.rake_require 'tasks/twitter'
    Rake::Task.define_task(:environment)
  end

  describe 'twitter:consume' do
    before do
      TweetStream.stub(:configure)
      TweetStream::Client.stub(:new) { double(:client, sample: true) }
    end

    let :run_rake_task do
      Rake::Task['twitter:consume'].reenable
      Rake.application.invoke_task 'twitter:consume'
    end

    it 'configures TweetStream' do
      expect(TweetStream).to receive(:configure)
      run_rake_task
    end

    it 'creates a stream client' do
      expect(TweetStream::Client).to receive(:new)
      run_rake_task
    end

  end
end
