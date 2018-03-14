class NewsPost
  include Mongoid::Document
  field :id, type: Integer
  field :title, type: String
  field :body, type: String
end
