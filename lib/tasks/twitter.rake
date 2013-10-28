require 'tweetstream'

namespace :twitter do

  desc "consume the twitter public stream API"
  task consume: :environment do
    TweetStream.configure do |config|
      config.consumer_key       = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret    = ENV['TWITTER_CONSUMER_SECRET']
      config.oauth_token        = ENV['TWITTER_OAUTH_TOKEN']
      config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
      config.auth_method        = :oauth
    end

    client = TweetStream::Client.new
    client.sample do |status|
      puts "#{status.text}"
    end
  end

end
