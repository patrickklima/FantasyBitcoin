class Transaction
  include Mongoid::Document
  field :id, type: Integer
  field :userID, type: Integer
  field :coinID, type: Interger
  field :price, type: Decimal
  field :quantity, type: Integer
  field :transBuy, type: Boolean
  field :date, type: Date
  field :transTotal, type: Decimal
end
