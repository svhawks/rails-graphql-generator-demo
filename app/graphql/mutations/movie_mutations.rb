module MovieMutations

  Create = GraphQL::Relay::Mutation.define do
    name 'CreateMovie'
    input_field :director_id, !types.Int
    input_field :ranking, !types.Int
    input_field :year, !types.Int
    input_field :name, !types.String

    return_field :movie, MovieType

    resolve -> (inputs, ctx) {
      root = RootLevel::STATIC
      attr = inputs.keys.inject({}) do |memo, key|
        memo[key] = inputs[key] unless key == "clientMutationId"
        memo
      end

      movie = Movie.create(attr)

      { movie: movie }
    }
  end

  Update = GraphQL::Relay::Mutation.define do
    name 'UpdateMovie'
    input_field :director_id, types.Int
    input_field :ranking, types.Int
    input_field :year, types.Int
    input_field :name, types.String

    input_field :id, !types.ID

    return_field :movie, MovieType

    resolve -> (inputs, ctx) {
      movie = NodeIdentification.object_from_id((inputs[:id]), ctx)
      attr = inputs.keys.inject({}) do |memo, key|
        memo[key] = inputs[key] unless key == "clientMutationId" || key == 'id'
        memo
      end

      movie.update(attr)
      { movie: movie }
    }
  end

  Destroy = GraphQL::Relay::Mutation.define do
    name "DestroyMovie"

    input_field :id, !types.ID

    resolve -> (inputs, ctx) {
      movie = NodeIdentification.object_from_id((inputs[:id]), ctx)
      movie.destroy
      { }
    }
  end
end
