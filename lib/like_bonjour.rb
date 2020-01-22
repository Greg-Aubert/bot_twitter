# ligne très importante qui appelle la gem.
require 'twitter'
require 'pry'

# n'oublie pas les lignes pour Dotenv ici…
require 'dotenv'# Appelle la gem Dotenv

Dotenv.load('.env')

# quelques lignes qui appellent les clés d'API de ton fichier .env

# ligne qui permet de tweeter sur ton compte
#client.update('Mon premier tweet en Ruby !!!! @the_hacking_pro')

def login_twitter
 client = Twitter::REST::Client.new do |config|
   config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
   config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
   config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
   config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
 end
 client
end

client = login_twitter

client.search('#bonjour_monde').take(25).each do |tweet|
  client.fav tweet
end

binding pry