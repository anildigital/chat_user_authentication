defmodule Chat.Users do
  alias Chat.Users.User

  alias Chat.Repo

  def new(), do: Ecto.Changeset.change(%User{}, %{})

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

  def update(user, params) do
    changeset = User.update_changeset(user, params)

    case Repo.update(changeset) do
      {:ok, user} ->
        {:ok, user}

      {:error, changeset} ->
        {:error, changeset}
    end
  end
end
