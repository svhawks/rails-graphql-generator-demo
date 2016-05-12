module PersonMutations

  Create = GraphQL::Relay::Mutation.define do
    name 'CreatePerson'
    input_field :ranking, !types.Int
    input_field :name, !types.String

    return_field :person, PersonType

    resolve -> (inputs, ctx) {
      root = RootLevel::STATIC
      attr = inputs.keys.inject({}) do |memo, key|
        memo[key] = inputs[key] unless key == "clientMutationId"
        memo
      end

      person = Person.create(attr)

      { person: person }
    }
  end

  Update = GraphQL::Relay::Mutation.define do
    name 'UpdatePerson'
    input_field :ranking, types.Int
    input_field :name, types.String

    input_field :id, !types.ID

    return_field :person, PersonType

    resolve -> (inputs, ctx) {
      person = NodeIdentification.object_from_id((inputs[:id]), ctx)
      attr = inputs.keys.inject({}) do |memo, key|
        memo[key] = inputs[key] unless key == "clientMutationId" || key == 'id'
        memo
      end

      person.update(attr)
      { person: person }
    }
  end

  Destroy = GraphQL::Relay::Mutation.define do
    name "DestroyPerson"

    input_field :id, !types.ID

    resolve -> (inputs, ctx) {
      person = NodeIdentification.object_from_id((inputs[:id]), ctx)
      person.destroy
      { }
    }
  end
end
