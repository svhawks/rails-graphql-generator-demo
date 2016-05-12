MovieType = GraphQL::ObjectType.define do
  name 'Movie'
  description 'Movie type'

  interfaces [NodeIdentification.interface]

  field :id, field: GraphQL::Relay::GlobalIdField.new('Movie')
  field :updated_at, types.String
  field :created_at, types.String
  field :director_id, types.Int
  field :ranking, types.Int
  field :year, types.Int
  field :name, types.String
    field :director do
    type -> { PersonType }

    resolve -> (movie, args, ctx) {
      movie.director
    }
  end

  connection :videos, -> { VideoType.connection_type } do
    resolve ->(movie, args, ctx) {
      movie.videos
    }
  end

# End of fields
end
