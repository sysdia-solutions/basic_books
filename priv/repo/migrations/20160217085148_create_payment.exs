defmodule BasicBooks.Repo.Migrations.CreatePayment do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :name, :string

      timestamps
    end

  end
end
