defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "When all parameters are valid, returns the IMC data.", %{conn: conn} do
      params = %{"filename" => "imc.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "result" => %{
          "Dani" => 23.437499999999996,
          "Diego" => 23.04002019946976,
          "Gabul" => 22.857142857142858,
          "Rafael" => 24.897060231734173,
          "Rodrigo" => 26.234567901234566
        }
      }

      assert response == expected_response
    end

    test "When there are invalid parameters, returns an error.", %{conn: conn} do
      params = %{"filename" => "banana.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Error opening file!"}

      assert response == expected_response
    end
  end
end
