defmodule BasicBooks.Company do
  use BasicBooks.Web, :model

  schema "companies" do
    field :company_number, :integer
    field :name, :string
    field :address, :string
    field :town, :string
    field :post_code, :string
    field :country, :string
    field :is_supplier, :boolean, default: false
    field :is_customer, :boolean, default: false
    belongs_to :term, BasicBooks.Term, foreign_key: :term_id

    timestamps
  end

  @required_fields ~w(company_number name address town post_code country is_supplier is_customer)
  @optional_fields ~w(term_id)

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
