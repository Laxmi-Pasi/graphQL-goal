module Types
  class MutationType < Types::BaseObject
    field :edit_article, mutation: Mutations::EditArticle
    field :remove_article, mutation: Mutations::RemoveArticle
    field :create_article, mutation: Mutations::CreateArticle
  end
end
