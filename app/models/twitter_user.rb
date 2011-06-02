class TwitterUser
  def initialize(user_identifier)
    user_response = Twitter.user(user_identifier)
    tweets_response = Twitter.user_timeline(user_identifier, :include_rts => true)
    @userName = user_response.screen_name
    @fullName = user_response.name
    @guid = user_response.id
    @location = user_response.location
    @bio = user_response.description
    @profileImageUrl = user_response.profile_image_url
    @tweetCount = user_response.statuses_count
    @followersCount = user_response.followers_count
    @followingCount = user_response.friends_count
    @tweets = tweets_response.collect{|tweet| {:text => tweet[:text]}}
  end
end
