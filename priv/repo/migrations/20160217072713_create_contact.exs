defmodule BasicBooks.Repo.Migrations.CreateContact do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :name, :string

      timestamps
    end

  end
end
