class User
  include Mongoid::Document
  has_one :portfolio
  field :email, type: String
  field :password, type: String
end
