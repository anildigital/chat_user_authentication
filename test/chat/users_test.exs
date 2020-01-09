defmodule Chat.UsersTest do
  use Chat.DataCase

  alias Chat.Users

  describe "Creating new users" do
    test "registers them" do
      {:ok, user} =
        Users.create(%{
          email: "user@example.com",
          first_name: "John",
          last_name: "User",
          password: "password",
          password_confirmation: "password"
        })

      assert user.email == "user@example.com"
      assert user.first_name == "John"
      assert(user.last_name == "User")
    end
  end
end
