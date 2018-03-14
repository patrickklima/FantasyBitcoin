task :seed => :environment do
# first delete all existing records
  Coin.all.delete
  Image.all.delete
  NewsPost.all.delete
  Portfolio.all.delete
  Transaction.all.delete
  User.all.delete

# seed database
# 30 coins
  names = ["Bitcoin", "Ethereum", "Litecoin", "bitcoin Cash", "Ripple", "Nucleus Vision", "Biance Coin", "Tronix", "Ethereum Classic", "EOS", "NEO", "NEM", "DigitalCash", "Monero", "Vechain", "Huobi Token", "ICON Project", "Nano", "Cardano", "IOS token", "Monaco", "ZCash", "Waves", "OmiseGo", "NuBits", "aelf", "Stellar", "IOTA", "Substratum Network", "QTUM"]

  syms = ["BTC", "ETH", "LTC", "BCH", "XRP", "NCASH", "BNB", "TRX", "ETC", "EOS", "NEO", "XEM", "DASH", "XMR", "VEN", "HT", "ICX", "XRB", "ADA", "IOST", "MCO", "ZEC", "WAVES", "OMG", "NBT", "ELF", "XLM", "IOT", "SUB", "QTUM" ];
  x = 0
  30.times do
    Coin.create(id: x,
                name: coins[x],
                sym: syms[x],
                logo: Faker::Avatar.image("my-own-slug", "50x50") )
    x +=1
  end

# 10 Images
  x = 0
  10.times do
    Image.create(id: x,
                 png: BSON::Binary.new,
                 source: Faker::Avatar.image)
    x += 1
  end

# 3 News Articles
  x = 0
  3.times do
    NewsPost.create(id: x,
                    title: "Post #{x}",
                    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus tenetur totam tempore quos! Sunt nulla distinctio dolorem blanditiis eaque accusamus animi provident culpa? Laudantium dolor minima, necessitatibus unde dolore quod.")
    x += 1
  end

# 10 Portfolios
  x = 0
  10.times do
    Portfolio.create(id: x,
                     cash: Faker::Number.decimal(2),
                     value: Faker::Number.decimal(1, 5))
    x += 1
  end

# 100 Transactions
  x = 0
  100.times do
    Transaction.create(id: x,
                       userID: Faker::Number.between(1, 10),
                       coinID: Faker::Number.between(1, 30),
                       price: Faker::Number.decimal(2, 5),
                       quantity: Faker::Number.digit,
                       transBuy: Faker::Boolean.boolean,
                       date: Faker::Date.backward(60),
                       total: Faker::Number.decimal(2))
    x +=1
  end

# 10 Users
  x = 0
  10.times do
    User.create(id: x,
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: "user#{x}@example.com",
                password: "#{x}idNum",
                picID: x,
                portID: x)
  x +=1
  end
end
