module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :user_id, ID, null: false
    field :user, Types::UserType, null: false
  end 
end
