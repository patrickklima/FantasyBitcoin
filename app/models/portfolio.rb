class Portfolio
  include Mongoid::Document
  field :cash, type: Decimal
  field :profit, type: Decimal
  embeds_many :transactions
end
