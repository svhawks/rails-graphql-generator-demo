MutationType = GraphQL::ObjectType.define do
  name 'MutationType'
  field :createVideo, field: VideoMutations::Create.field
  field :updateVideo, field: VideoMutations::Update.field
  field :destroyVideo, field: VideoMutations::Destroy.field

  field :createMovie, field: MovieMutations::Create.field
  field :updateMovie, field: MovieMutations::Update.field
  field :destroyMovie, field: MovieMutations::Destroy.field

  field :createPerson, field: PersonMutations::Create.field
  field :updatePerson, field: PersonMutations::Update.field
  field :destroyPerson, field: PersonMutations::Destroy.field

end
