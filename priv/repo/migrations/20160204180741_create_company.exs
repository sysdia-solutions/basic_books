defmodule BasicBooks.Repo.Migrations.CreateCompany do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :company_number, :integer
      add :name, :text
      add :address, :text
      add :town, :text
      add :post_code, :text
      add :country, :text
      add :is_supplier, :boolean, default: false
      add :is_customer, :boolean, default: false
      add :term_id, references(:terms, on_delete: :nothing)

      timestamps
    end
    create index(:companies, [:term_id])

  end
end
