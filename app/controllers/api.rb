require 'dotenv'
require 'md5'
Dotenv.load

def get_url(endpoint)
  base_url = "https://gateway.marvel.com/v1/public"
  public_key = ENV["MARVEL_PUBLIC_KEY"]
  private_key = ENV["MARVEL_PRIVATE_KEY"]
  ts = Time.now.to_i
  hash = MD5.new.digest "#{ts}#{private_key}#{public_key}"

  "#{base_url}#{endpoint}?ts=#{ts}&apikey=#{public_key}&hash=#{hash}"
end
