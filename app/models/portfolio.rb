class Portfolio
  include Mongoid::Document
  field :cashInvested, type: Decimal
  field :profit, type: Decimal
  has_one :user
end
