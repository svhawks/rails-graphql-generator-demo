VideoType = GraphQL::ObjectType.define do
  name 'Video'
  description 'Video type'

  interfaces [NodeIdentification.interface]

  field :id, field: GraphQL::Relay::GlobalIdField.new('Video')
  field :updated_at, types.String
  field :created_at, types.String
  field :movie_id, types.Int
  field :file_url, types.String
  field :name, types.String
    field :movie do
    type -> { MovieType }

    resolve -> (video, args, ctx) {
      video.movie
    }
  end

# End of fields
end
