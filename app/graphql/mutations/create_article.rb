module Mutations
  class CreateArticle < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :user_id, Integer , required: true
    field :article, Types::ArticleType, null: false
    field :errors, [String]
    field :message, String

    def resolve(title:, description:, user_id:)
      user = User.find_by_id(user_id)
      return { errors: 'user not found' } if user.nil?
      article = user.articles.new(title: title, description: description)
      if article.save!
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
