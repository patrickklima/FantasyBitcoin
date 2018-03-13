class Coin
  include Mongoid::Document
  field :type, type: String
  field :price, type: Decimal
  field :symbol, type: String
  field :change1, type: Decimal
  field :change7, type: Decimal
  field :change28, type: Decimal
  field :marketCap, type: NumberInt
  field :totalCoins, type: NumberInt
end
