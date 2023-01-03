module Mutations
  class CreateUserAndArticle < BaseMutation
    field :user, Types::UserType, null: false
    field :article, Types::ArticleType, null: false
    
    field :errors, [String]
    field :message, String
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :title, String, required: true
    argument :description, String, required: true

    def resolve(first_name:, last_name:, email:, password:, title:, description:)
      user = User.new(first_name: first_name, last_name:last_name, email: email, password: password)
      if user.save!
        {
          # article = user.articles.create!(title: title, description: description)
        }
      else
        {
          errors: [user.errors.full_messages]
        }
      end
    end

  end
end
