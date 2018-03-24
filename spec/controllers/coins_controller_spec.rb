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

  describe "GET coin" do
    context "with a successful response" do
      it "returns the time field for the coin for each day", :vcr do
        get :coin, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["time"]).to eq(1521590400)
        expect(body["tsym"]["1"]["time"]).to eq(1521676800)
        expect(body["tsym"]["2"]["time"]).to eq(1521763200)
      end

      it "returns the close field for the coin for each day", :vcr do
        get :coin, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["close"]).to eq(559.91)
        expect(body["tsym"]["1"]["close"]).to eq(539.89)
        expect(body["tsym"]["2"]["close"]).to eq(543.83)
      end

      it "returns the high field for the coin for each day", :vcr do
        get :coin, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["high"]).to eq(590.2)
        expect(body["tsym"]["1"]["high"]).to eq( 578.01)
        expect(body["tsym"]["2"]["high"]).to eq(543.84)
      end

      it "returns the low field for the coin for each day", :vcr do
        get :coin, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["low"]).to eq(545.48)
        expect(body["tsym"]["1"]["low"]).to eq(516.22)
        expect(body["tsym"]["2"]["low"]).to eq(506.79)
      end

      it "returns the open field for the coin for each day", :vcr do
        get :coin, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["open"]).to eq(557.57)
        expect(body["tsym"]["1"]["open"]).to eq(559.91)
        expect(body["tsym"]["2"]["open"]).to eq(539.89)
      end

      it "returns the volumefrom field for the coin for each day", :vcr do
        get :coin, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["volumefrom"]).to eq(488509.24)
        expect(body["tsym"]["1"]["volumefrom"]).to eq(431953.84)
        expect(body["tsym"]["2"]["volumefrom"]).to eq(432407.55)
      end

      it "returns the volumeto field for the coin for each day", :vcr do
        get :coin, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["volumeto"]).to eq(277714049.38)
        expect(body["tsym"]["1"]["volumeto"]).to eq(233985932.96)
        expect(body["tsym"]["2"]["volumeto"]).to eq(225200086.3)
      end





    end
  end

end
