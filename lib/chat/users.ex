defmodule Chat.Users do
  alias Chat.Users.User

  alias Chat.Repo

  def create(params) do
    changeset = User.create_changeset(%User{}, params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        user
        #        |> Emails.welcome_email()
        #        |> Mailer.deliver_later()

        {:ok, user}

      {:error, changeset} ->
        {:error, changeset}
    end
  end
end
