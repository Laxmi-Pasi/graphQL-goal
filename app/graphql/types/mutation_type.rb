module Types
  class MutationType < Types::BaseObject
    field :create_user_and_article, mutation: Mutations::CreateUserAndArticle
    field :create_user, mutation: Mutations::CreateUser
    field :edit_article, mutation: Mutations::EditArticle
    field :remove_article, mutation: Mutations::RemoveArticle
    field :create_article, mutation: Mutations::CreateArticle
  end
end
