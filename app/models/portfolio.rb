class Portfolio
  include Mongoid::Document
  field :id, type: NumberInt
  field :cash, type: Decimal
  field :value, type: Decimal
end
