module Mutations
  class CreateArticle < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    field :article, Types::ArticleType, null: false
    field :errors, [String]
    field :message, String

    def resolve(title:, description:)
      article = Article.create!(title: title, description: description)
      if article
        {
          message: 'article created',
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
