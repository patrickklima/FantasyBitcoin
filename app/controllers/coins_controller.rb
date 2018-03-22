class CoinsController < ApplicationController
  def index
    syms = params["fsyms"]

    if syms
      url = URI.parse("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=#{syms}&tsyms=BTC,USD")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(url.to_s)
      response = http.request(request)

      api_data = JSON.parse response.read_body

      sym_array = syms.split(',')

      client_response = {}
      client_response["coins"] = {}

      sym_array.each do |sym|
        client_response["coins"][sym] = {}
        client_response["coins"][sym]["USD"] = {}
        client_response["coins"][sym]["BTC"] = {}
        client_response["coins"][sym]["USD"]["marketCap"] = api_data["RAW"][sym]["USD"]["MKTCAP"]
        client_response["coins"][sym]["BTC"]["marketCap"] = api_data["RAW"][sym]["BTC"]["MKTCAP"]
        client_response["coins"][sym]["USD"]["supply"] = api_data["RAW"][sym]["USD"]["SUPPLY"]
        client_response["coins"][sym]["BTC"]["supply"] = api_data["RAW"][sym]["BTC"]["SUPPLY"]
        client_response["coins"][sym]["USD"]["24HrVolume"] = api_data["RAW"][sym]["USD"]["TOTALVOLUME24HTO"]
        client_response["coins"][sym]["BTC"]["24HrVolume"] = api_data["RAW"][sym]["BTC"]["TOTALVOLUME24HTO"]
        client_response["coins"][sym]["USD"]["24HrPctPrice"] = api_data["RAW"][sym]["USD"]["CHANGEPCT24HOUR"]
        client_response["coins"][sym]["BTC"]["24HrPctPrice"] = api_data["RAW"][sym]["BTC"]["CHANGEPCT24HOUR"]
        client_response["coins"][sym]["USD"]["price"] = api_data["RAW"][sym]["USD"]["PRICE"]
        client_response["coins"][sym]["BTC"]["price"] = api_data["RAW"][sym]["BTC"]["PRICE"]
      end
    end


    json_response(client_response || {})
  end
end
