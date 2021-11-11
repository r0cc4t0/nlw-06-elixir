defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "When all parameters are valid, returns a valid changeset." do
      params = %{name: "Rafael", email: "rafael@banana.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{name: "Rafael", email: "rafael@banana.com", password: "123456"},
               errors: []
             } = response
    end

    test "When there are invalid parameters, returns an invalid changeset." do
      params = %{name: "R", email: "rafael@banana.com"}

      response = User.changeset(params)

      expected_response = %{
        name: ["should be at least 2 character(s)"],
        password: ["can't be blank"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
