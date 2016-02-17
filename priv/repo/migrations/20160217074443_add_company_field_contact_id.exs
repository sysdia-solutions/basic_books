defmodule BasicBooks.Repo.Migrations.AddCompanyFieldContactId do
  use Ecto.Migration

  def change do
    alter table(:companies) do
      add :contact_id, references(:contacts, on_delete: :nothing)
    end

    create index(:companies, [:contact_id])
  end
end
