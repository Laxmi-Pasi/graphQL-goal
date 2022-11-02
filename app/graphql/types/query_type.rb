module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :articles, [Types::ArticleType], null: false, description: 'Return a list of articles.'

    # /articles
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
  end
end
