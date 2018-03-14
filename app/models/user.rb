class User
  include Mongoid::Document
  field :id, type: Integer
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String
  field :picID, type: Integer
  field :portID, type: Integer
end
