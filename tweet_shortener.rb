def dictionary
  dictionary = {
    "hello" => 'hi',
    "to" => "2",
    "two" => '2',
    "too" => '2',
    "for" => '4',
    "four" => '4',
    'be' => 'b',
    'you' => 'u',
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
  tweet_to_array = tweet.split(" ")
  tweet_to_array.collect do |word|
    dictionary.collect do |key, value|
      if word.downcase == key
        word.replace(value)
      end
    end
  end
  tweet_to_array.join(" ")
end

def bulk_tweet_shortener(tweets)
  tweets.collect do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  if word_substituter(tweet).length > 140
    word_substituter(tweet)[0...137] + "..."
  else
    tweet
  end
end
