class Portfolio
  include Mongoid::Document
  field :id, type: Integer
  field :cash, type: Decimal
  field :value, type: Decimal
end
