defmodule WabanexWeb.Schemas.Types.User do
  use Absinthe.Schema.Notation

  @desc "User Logical Representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :trainings, list_of(:training)
  end

  input_object :create_user_input do
    field :name, non_null(:string), description: "Username"
    field :email, non_null(:string), description: "User Email"
    field :password, non_null(:string), description: "User Password"
  end
end
