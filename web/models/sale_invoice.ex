defmodule BasicBooks.SaleInvoice do
  use BasicBooks.Web, :model

  schema "sale_invoices" do
    field :reference, :string
    field :invoice_date, Ecto.DateTime
    field :paid_date, Ecto.DateTime
    field :po_number, :string
    field :is_credit_note, :boolean, default: false
    field :resolved_vat, :boolean, default: false
    field :resolved_corp, :boolean, default: false
    belongs_to :company, BasicBooks.Company
    belongs_to :contact, BasicBooks.Contact
    belongs_to :term, BasicBooks.Term
    belongs_to :payment, BasicBooks.Payment

    timestamps
  end

  @required_fields ~w(reference invoice_date paid_date po_number is_credit_note resolved_vat resolved_corp)
  @optional_fields ~w(company_id contact_id term_id payment_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
