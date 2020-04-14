class TwitterClient
    def self.home_timeline
      client.home_timeline
    end


    def self.tweet(message)
      client.update(message)
    end


    private
    # loads up keys so we can use the key 
    def self.search(term)
        tweets = []
        client.search("from:#{term}").each do |tweet|
          user = tweet.user || break
          tweets << {
            id: tweet.id,
            text: tweet.text,
            user: {
              screen_name: user.screen_name,
              name: user.name,
              profile_image_url: user.profile_image_url.to_s,
              url: user.url
            }
          }
        end
        tweets #returns back tweets 
      end


      def self.client #whenever it runs through our client  
        Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
          config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
          config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
          config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
        end
      end
  end
