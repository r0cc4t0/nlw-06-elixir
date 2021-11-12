defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "Users Queries" do
    test "When a valid ID is given, returns the user.", %{conn: conn} do
      params = %{name: "Rafael", email: "rafael@banana.com", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}") {
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "rafael@banana.com",
            "name" => "Rafael"
          }
        }
      }

      assert response == expected_response
    end
  end

  describe "Users Mutations" do
    test "When all parameters are valid, creates the user.", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {
            name: "João", email: "joao@banana.com", password: "12345678"
          }){
            id
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "João"}}} = response
    end
  end
end
