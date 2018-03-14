class Transaction
  include Mongoid::Document
  has_one :user
  field :type, type: Boolean
  field :price, type: Decimal
  field :symFrom, type: String
  field :symTo, type: String
  field :quantity, type: Integer
  field :date, type: Date
end
