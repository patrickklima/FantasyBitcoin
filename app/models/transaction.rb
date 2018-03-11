class Transaction
  include Mongoid::Document
  field :userID, type: NumberInt
  field :coinID, type: NumberInt
  field :price, type: Decimal
  field :quantity, type: NumberInt
  field :transBuy, type: Boolean
  field :date, type: Date
  field :transTotal, type: Decimal
end
