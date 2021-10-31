defmodule WabanexWeb.Schemas.Types.User do
  use Absinthe.Schema.Notation

  import_types WabanexWeb.Schemas.Types.Custom.UUID4

  @desc "User Logical Representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end
end
