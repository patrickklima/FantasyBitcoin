class Image
  include Mongoid::Document
  field :png, type: Bson::Binary
  field :source, type: String
end
