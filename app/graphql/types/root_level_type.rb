RootLevelType = GraphQL::ObjectType.define do
  name 'RootLevel'
  description 'Unassociated root object queries'

  interfaces [NodeIdentification.interface]

  field :id, field: GraphQL::Relay::GlobalIdField.new('RootLevel')
  connection :videos, VideoType.connection_type do
    resolve ->(object, args, ctx){
      Video.all
    }
  end
  connection :movies, MovieType.connection_type do
    resolve ->(object, args, ctx){
      Movie.all
    }
  end
  connection :people, PersonType.connection_type do
    resolve ->(object, args, ctx){
      Person.all
    }
  end
end