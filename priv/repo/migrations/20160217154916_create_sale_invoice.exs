defmodule BasicBooks.Repo.Migrations.CreateSaleInvoice do
  use Ecto.Migration

  def change do
    create table(:sale_invoices) do
      add :reference, :string
      add :invoice_date, :datetime
      add :paid_date, :datetime
      add :po_number, :string
      add :is_credit_note, :boolean, default: false
      add :resolved_vat, :boolean, default: false
      add :resolved_corp, :boolean, default: false
      add :company_id, references(:companies, on_delete: :nothing)
      add :contact_id, references(:contacts, on_delete: :nothing)
      add :term_id, references(:terms, on_delete: :nothing)
      add :payment_id, references(:payments, on_delete: :nothing)

      timestamps
    end
    create index(:sale_invoices, [:company_id])
    create index(:sale_invoices, [:contact_id])
    create index(:sale_invoices, [:term_id])
    create index(:sale_invoices, [:payment_id])

  end
end
