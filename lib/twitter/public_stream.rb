module Twitter
  class PublicStream
    include HTTParty
    base_uri 'https://stream.twitter.com'
  end
end
