module Mutations
  class EditArticle < BaseMutation
    argument :id, Integer
    argument :title, String
    argument :description, String
    field :message, String
    field :errors, [String]
    field :article, Types::ArticleType, null: false

    def resolve(id:, title:, description:)
      article = Article.find_by_id(id)
      return { errors: 'article not found' } if article.nil?

      if article.update!(title: title, description: description)
        {
          message: 'article updated.',
          article: article
        }
      else
        {
          errors: [article.errors.full_messages]
        }
      end
    end
  end
end
