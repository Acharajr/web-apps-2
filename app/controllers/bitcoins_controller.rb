class BitcoinsController < ApplicationController

  def index
    #add backend code

    bitcoin = params["amount"]


    # connect to the Coindesk API
    # DON'T CHANGE THIS CODE
    # ----------------------
    require "net/http"
    require "json"
    url = "https://api.coindesk.com/v1/bpi/currentprice.json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    bitcoin_data = JSON.parse(response)
    # ----------------------
  
    # using Coindesk API, extract current rate of bitcoin in USD
    @usd_rate = bitcoin_data["bpi"]["USD"]["rate_float"]
  
    # calculate value in USD of user's bitcoin
    @usd_value = @usd_rate * bitcoin.to_f
  
    # render bitcoins/index view
  end

end