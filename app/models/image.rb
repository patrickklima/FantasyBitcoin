class Image
  include Mongoid::Document
  field :id, type: Integer
  field :png, type: Bson::Binary
  field :source, type: String
end
