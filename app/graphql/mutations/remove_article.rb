module Mutations
  class RemoveArticle < BaseMutation
    field :article, Types::ArticleType, null: false
    field :message, String
    field :errors, String

    argument :id, String, required: true

    # article/:id
    def resolve(id:)
      article = Article.find_by_id(id)
      return { errors: 'article not found' } if article.nil?
      if article.destroy!
        {
        message: 'Article has been deleted successfully.'
        }
      end
    end
  end
end
