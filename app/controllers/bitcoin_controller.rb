class BitcoinController < ApplicationController
  def price
    latest_price = Bitcoin.latest_price
    price_change = Bitcoin.price_change_24h

    if Bitcoin.fetch_current_price
      new_price = Bitcoin.latest_price
      new_change = Bitcoin.price_change_24h
      
      render json: {
        price: new_price,
        price_change: new_change,
        status: 'success'
      }
    else
      if latest_price
        render json: {
          price: latest_price,
          price_change: price_change,
          status: 'cached'
        }
      else
        render json: {
          error: 'Failed to fetch Bitcoin price',
          status: 'error'
        }, status: :service_unavailable
      end
    end
  end
end 