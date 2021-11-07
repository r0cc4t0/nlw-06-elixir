defmodule WabanexWeb.Schemas.Types.Training do
  use Absinthe.Schema.Notation

  import_types WabanexWeb.Schemas.Types.Exercise

  @desc "Training Logical Representation"
  object :training do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:exercise)
  end

  input_object :create_training_input do
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :user_id, non_null(:uuid4)
    field :exercises, list_of(:create_exercise_input)
  end
end
