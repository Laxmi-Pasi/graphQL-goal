module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # /users
    field :users, [Types::UserType], null: false, description: 'Return a list of users.'

    def users
      User.all
    end

    # /articles
    field :articles, [Types::ArticleType], null: false, description: 'Return a list of articles.'

    def articles
      Article.all
    end

    # /article/:id
    field :article, ArticleType, null: true do
      argument :id, ID, required: true
    end

    def article(id:)
      Article.find_by(id: id)
    end

    field :user_with_articles, Types::UserType, null: false, description: 'Return a list of users.'
  end
end
