class Coin
  include Mongoid::Document
  field :id, type: Integer
  field :type, type: String
  field :symbol, type: String
  field :logo, type: Image
end
