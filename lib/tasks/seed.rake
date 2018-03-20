namespace :db do
  task :seed => :environment do
  # first delete all existing records
    NewsPost.all.delete
    Portfolio.all.delete
    Coin.all.delete
    Transaction.all.delete
    User.all.delete

  # seed database
  # 30 stocks
    names = ["Bitcoin", "Ethereum", "Litecoin", "bitcoin Cash", "Ripple", "Nucleus Vision", "Biance Coin", "Tronix", "Ethereum Classic", "EOS", "NEO", "NEM", "DigitalCash", "Monero", "Vechain", "Huobi Token", "ICON Project", "Nano", "Cardano", "IOS token", "Monaco", "ZCash", "Waves", "OmiseGo", "NuBits", "aelf", "Stellar", "IOTA", "Substratum Network", "QTUM"]

    syms = ["BTC", "ETH", "LTC", "BCH", "XRP", "NCASH", "BNB", "TRX", "ETC", "EOS", "NEO", "XEM", "DASH", "XMR", "VEN", "HT", "ICX", "XRB", "ADA", "IOST", "MCO", "ZEC", "WAVES", "OMG", "NBT", "ELF", "XLM", "IOT", "SUB", "QTUM" ]
    x = 0
    30.times do
      Coin.create(name: names[x],
                  symbol: syms[x],
                  logoURL: Faker::Avatar.image("my-own-slug", "50x50") )
      x += 1
    end

    user = User.create(email: "user@example.com", password: "idNum")

  # 3 News Articles
    3.times do
      NewsPost.create(newsPostURL: Faker::Internet.url)
    end

  # 10 Portfolios
    x = 0
    10.times do
      Portfolio.create(cashInvested: Faker::Number.decimal(2),
                       profit: Faker::Number.decimal(1, 5),
                       user_id: user.id)
      x += 1
    end

  # 100 Transactions
    100.times do
      Transaction.create(user_id: user.id,
                         symFrom: syms[Faker::Number.between(0, 29)],
                         symTo: syms[Faker::Number.between(0, 29)],
                         price: Faker::Number.decimal(2, 5),
                         quantity: Faker::Number.digit,
                         date: Faker::Date.backward(60))
    end

  # 10 Users
    # x = 0
    # 10.times do
    #   User.create(email: "user#{x}@example.com",
    #               password: "#{x}idNum")
    #   x += 1
    # end
  end
end
