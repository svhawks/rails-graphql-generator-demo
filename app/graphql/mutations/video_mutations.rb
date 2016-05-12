module VideoMutations

  Create = GraphQL::Relay::Mutation.define do
    name 'CreateVideo'
    input_field :movie_id, !types.Int
    input_field :file_url, !types.String
    input_field :name, !types.String

    return_field :video, VideoType

    resolve -> (inputs, ctx) {
      root = RootLevel::STATIC
      attr = inputs.keys.inject({}) do |memo, key|
        memo[key] = inputs[key] unless key == "clientMutationId"
        memo
      end

      video = Video.create(attr)

      { video: video }
    }
  end

  Update = GraphQL::Relay::Mutation.define do
    name 'UpdateVideo'
    input_field :movie_id, types.Int
    input_field :file_url, types.String
    input_field :name, types.String

    input_field :id, !types.ID

    return_field :video, VideoType

    resolve -> (inputs, ctx) {
      video = NodeIdentification.object_from_id((inputs[:id]), ctx)
      attr = inputs.keys.inject({}) do |memo, key|
        memo[key] = inputs[key] unless key == "clientMutationId" || key == 'id'
        memo
      end

      video.update(attr)
      { video: video }
    }
  end

  Destroy = GraphQL::Relay::Mutation.define do
    name "DestroyVideo"

    input_field :id, !types.ID

    resolve -> (inputs, ctx) {
      video = NodeIdentification.object_from_id((inputs[:id]), ctx)
      video.destroy
      { }
    }
  end
end
