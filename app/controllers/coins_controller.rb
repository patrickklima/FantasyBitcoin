class CoinsController < ApplicationController
  def index
    syms = params["fsyms"]

    if syms
      # Static information on coins
      response1 = getApiResponse("https://min-api.cryptocompare.com/data/all/coinlist?fsyms=#{syms}")

      # Dynamic information on coins
      response2 = getApiResponse("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=#{syms}&tsyms=BTC,USD")

      api_data1 = JSON.parse response1.read_body
      api_data2 = JSON.parse response2.read_body

      sym_array = syms.split(',')

      client_response = { response1: JSON.parse(response1.read_body), response2: JSON.parse(response2.read_body) }

      client_response = {}
      client_response["coins"] = {}

      sym_array.each do |sym|
        client_response["coins"][sym] = {}
        client_response["coins"][sym]["USD"] = {}
        client_response["coins"][sym]["BTC"] = {}

        client_response["coins"][sym]["SortOrder"] = api_data1["Data"][sym]["SortOrder"]
        client_response["coins"][sym]["Symbol"] = api_data1["Data"][sym]["Symbol"]
        client_response["coins"][sym]["CoinName"] = api_data1["Data"][sym]["CoinName"]
        client_response["coins"][sym]["ImageUrl"] = api_data1["Data"][sym]["ImageUrl"]



        client_response["coins"][sym]["USD"]["marketCap"] = api_data2["RAW"][sym]["USD"]["MKTCAP"]
        client_response["coins"][sym]["BTC"]["marketCap"] = api_data2["RAW"][sym]["BTC"]["MKTCAP"]
        client_response["coins"][sym]["USD"]["supply"] = api_data2["RAW"][sym]["USD"]["SUPPLY"]
        client_response["coins"][sym]["BTC"]["supply"] = api_data2["RAW"][sym]["BTC"]["SUPPLY"]
        client_response["coins"][sym]["USD"]["24HrVolume"] = api_data2["RAW"][sym]["USD"]["TOTALVOLUME24HTO"]
        client_response["coins"][sym]["BTC"]["24HrVolume"] = api_data2["RAW"][sym]["BTC"]["TOTALVOLUME24HTO"]
        client_response["coins"][sym]["USD"]["24HrPctPrice"] = api_data2["RAW"][sym]["USD"]["CHANGEPCT24HOUR"]
        client_response["coins"][sym]["BTC"]["24HrPctPrice"] = api_data2["RAW"][sym]["BTC"]["CHANGEPCT24HOUR"]
        client_response["coins"][sym]["USD"]["price"] = api_data2["RAW"][sym]["USD"]["PRICE"]
        client_response["coins"][sym]["BTC"]["price"] = api_data2["RAW"][sym]["BTC"]["PRICE"]
      end
    end
    json_response(client_response || {})
  end

  def double_api_test
    response1 = getApiResponse("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=BTC,USD")
    response2 = getApiResponse("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=DOGE&tsyms=BTC,USD")

    client_response = { response1: JSON.parse(response1.read_body), response2: JSON.parse(response2.read_body) }
    json_response(client_response || {})
  end

  private

  def getApiResponse(apiUrl)
    url = URI.parse(apiUrl)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url.to_s)
    response = http.request(request)
  end
end
