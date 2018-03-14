class Portfolio
  include Mongoid::Document
  field :cash, type: Decimal
  field :profit, type: Decimal
  has_one :user
end
