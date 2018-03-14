class Coin
  include Mongoid::Document
  field :id, type NumberInt
  field :type, type: String
  field :symbol, type: String
  field :marketCap, type: NumberInt
end
