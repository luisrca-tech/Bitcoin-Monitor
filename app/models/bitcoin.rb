require 'net/http'
require 'json'

class Bitcoin < ApplicationRecord
  validates :price, presence: true
  validates :timestamp, presence: true

  def self.fetch_current_price
    begin
      url = URI('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd')
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.read_timeout = 5
      http.open_timeout = 5
      
      response = http.get(url.request_uri)
      data = JSON.parse(response.body)
      
      price = data['bitcoin']['usd']
      
      record = create(
        price: price,
        timestamp: Time.current
      )
      
      record
    rescue Net::OpenTimeout, Net::ReadTimeout => e
      nil
    rescue SocketError => e
      nil
    rescue JSON::ParserError => e
      nil
    rescue StandardError => e
      nil
    end
  end

  def self.latest_price
    record = order(created_at: :desc).first
    price = record&.price
    price
  end

  def self.price_change_24h
    latest = order(created_at: :desc).first
    oldest = where('created_at >= ?', 24.hours.ago).order(created_at: :asc).first
    
    return 0 unless latest && oldest
    
    change = ((latest.price - oldest.price) / oldest.price * 100).round(2)
    change
  end
end
