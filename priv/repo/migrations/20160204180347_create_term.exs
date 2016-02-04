defmodule BasicBooks.Repo.Migrations.CreateTerm do
  use Ecto.Migration

  def change do
    create table(:terms) do
      add :name, :string
      add :days, :integer

      timestamps
    end

  end
end
