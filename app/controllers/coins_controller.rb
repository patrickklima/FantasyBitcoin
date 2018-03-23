class CoinsController < ApplicationController
  def index
    syms = params["fsyms"]

    if syms
      response = getApiResponse("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=#{syms}&tsyms=BTC,USD")

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
