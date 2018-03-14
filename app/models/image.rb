class Image
  include Mongoid::Document
  field :id, type: NumberInt
  field :png, type: Bson::Binary
  field :source, type: String
end
