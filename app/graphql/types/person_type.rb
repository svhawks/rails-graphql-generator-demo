PersonType = GraphQL::ObjectType.define do
  name 'Person'
  description 'Person type'

  interfaces [NodeIdentification.interface]

  field :id, field: GraphQL::Relay::GlobalIdField.new('Person')
  field :updated_at, types.String
  field :created_at, types.String
  field :ranking, types.Int
  field :name, types.String
    connection :movies, -> { MovieType.connection_type } do
    resolve ->(person, args, ctx) {
      person.movies
    }
  end

# End of fields
end
