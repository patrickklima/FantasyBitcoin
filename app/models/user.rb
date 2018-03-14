class User
  include Mongoid::Document
  field :id, type: NumberInt
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String
  field :picID, type: NumberInt
  field :portID, type: NumberInt
end
