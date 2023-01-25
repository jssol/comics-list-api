require 'dotenv'
require 'json'
require 'digest'
Dotenv.load

module UrlHelperMethods
  def get_url(endpoint)
    base_url = 'https://gateway.marvel.com/v1/public'
    public_key = ENV.fetch('MARVEL_PUBLIC_KEY', nil)
    private_key = ENV.fetch('MARVEL_PRIVATE_KEY', nil)
    md5 = Digest::MD5.new
    ts = Time.now.to_i
    hash = md5.hexdigest "#{ts}#{private_key}#{public_key}"

    "#{base_url}#{endpoint}?ts=#{ts}&apikey=#{public_key}&hash=#{hash}"
  end

  def get_search_url(type, query)
    base_url = 'https://gateway.marvel.com/v1/public'
    public_key = ENV.fetch('MARVEL_PUBLIC_KEY', nil)
    private_key = ENV.fetch('MARVEL_PRIVATE_KEY', nil)
    md5 = Digest::MD5.new
    ts = Time.now.to_i
    hash = md5.hexdigest "#{ts}#{private_key}#{public_key}"

    "#{base_url}/#{type}?#{query}&ts=#{ts}&apikey=#{public_key}&hash=#{hash}"
  end
end
