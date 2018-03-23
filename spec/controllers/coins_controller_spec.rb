require 'rails_helper'

describe CoinsController do
  describe "GET index" do
    context "with a successful response" do
      it "returns a status code of 200", :vcr do
        get :index
        expect(response).to have_http_status(200)
      end

      it "returns a repsonse with empty coin info if there are no tsyms passed in the request", :vcr do
        get :index
        expect(JSON.parse response.body).to eq({})
      end


      it "returns the sort order for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["SortOrder"]).to eq("2")
        expect(body["coins"]["DOGE"]["SortOrder"]).to eq("8")
      end

      it "returns the symbol for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["Symbol"]).to eq("ETH")
        expect(body["coins"]["DOGE"]["Symbol"]).to eq("DOGE")
      end

      it "returns the coin name for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["CoinName"]).to eq("Ethereum")
        expect(body["coins"]["DOGE"]["CoinName"]).to eq("Dogecoin")
      end

      it "returns the coin image for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE"}
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["ImageUrl"]).to eq("/media/20646/eth_logo.png")
        expect(body["coins"]["DOGE"]["ImageUrl"]).to eq("/media/19684/doge.png")
      end


      it "returns the marketcap for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["USD"]["marketCap"]).to be_present
        expect(body["coins"]["ETH"]["BTC"]["marketCap"]).to be_present
        expect(body["coins"]["DOGE"]["USD"]["marketCap"]).to be_present
        expect(body["coins"]["DOGE"]["BTC"]["marketCap"]).to be_present
      end

      it "returns the supply for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["USD"]["supply"]).to be_present
        expect(body["coins"]["ETH"]["BTC"]["supply"]).to be_present
        expect(body["coins"]["DOGE"]["USD"]["supply"]).to be_present
        expect(body["coins"]["DOGE"]["BTC"]["supply"]).to be_present
      end

      it "returns the 24HrVolume for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["USD"]["24HrVolume"]).to be_present
        expect(body["coins"]["ETH"]["BTC"]["24HrVolume"]).to be_present
        expect(body["coins"]["DOGE"]["USD"]["24HrVolume"]).to be_present
        expect(body["coins"]["DOGE"]["BTC"]["24HrVolume"]).to be_present
      end

      it "returns the 24HrPctPrice for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["USD"]["24HrPctPrice"]).to be_present
        expect(body["coins"]["ETH"]["BTC"]["24HrPctPrice"]).to be_present
        expect(body["coins"]["DOGE"]["USD"]["24HrPctPrice"]).to be_present
        expect(body["coins"]["DOGE"]["BTC"]["24HrPctPrice"]).to be_present
      end

      it "returns the price for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["USD"]["price"]).to be_present
        expect(body["coins"]["ETH"]["BTC"]["price"]).to be_present
        expect(body["coins"]["DOGE"]["USD"]["price"]).to be_present
        expect(body["coins"]["DOGE"]["BTC"]["price"]).to be_present
      end
    end
  end

  describe "GET double_api_test", :vcr do
    it "stores the first response" do
      get :double_api_test
      body = JSON.parse response.body
      expect(body["response1"]).to be_present
    end

    it "stores the second response", :vcr do
      get :double_api_test
      body = JSON.parse response.body
      expect(body).to be_present
    end
  end
end
