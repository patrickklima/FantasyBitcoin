class NewsPost
  include Mongoid::Document
  field :id, type: NumberInt
  field :title, type: String
  field :body, type: String
end
