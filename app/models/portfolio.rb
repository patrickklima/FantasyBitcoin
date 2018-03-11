class Portfolio
  include Mongoid::Document
  field :cash, type: Decimal
  field :value, type: Decimal
end
