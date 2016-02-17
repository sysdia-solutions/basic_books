defmodule BasicBooks.SaleInvoiceController do
  use BasicBooks.Web, :controller

  alias BasicBooks.SaleInvoice
  alias BasicBooks.Company
  alias BasicBooks.Contact
  alias BasicBooks.Term
  alias BasicBooks.Payment

  plug :scrub_params, "sale_invoice" when action in [:create, :update]

  defp preload_all(data) do
    data
    |> Repo.preload([:company])
    |> Repo.preload([:contact])
    |> Repo.preload([:payment])
    |> Repo.preload([:term])
  end

  defp assigns(changeset, record \\ nil) do
    companies = collection_enum(Company, :name)
    contacts = collection_enum(Contact, :name)
    terms = collection_enum(Term, :name)
    payments = collection_enum(Payment, :name)

    [
      sale_invoice: record,
      changeset: changeset,
      companies: companies,
      contacts: contacts,
      terms: terms,
      payments: payments
    ]
  end

  def index(conn, _params) do
    sale_invoices = Repo.all(SaleInvoice)
                    |> preload_all()
    render(conn, "index.html", sale_invoices: sale_invoices)
  end

  def new(conn, _params) do
    changeset = SaleInvoice.changeset(%SaleInvoice{})
    render(conn, "new.html", assigns(changeset))
  end

  def create(conn, %{"sale_invoice" => sale_invoice_params}) do
    changeset = SaleInvoice.changeset(%SaleInvoice{}, sale_invoice_params)

    case Repo.insert(changeset) do
      {:ok, _sale_invoice} ->
        conn
        |> put_flash(:info, "Sale invoice created successfully.")
        |> redirect(to: sale_invoice_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", assigns(changeset))
    end
  end

  def show(conn, %{"id" => id}) do
    sale_invoice = Repo.get!(SaleInvoice, id)
                   |> preload_all()
    render(conn, "show.html", sale_invoice: sale_invoice)
  end

  def edit(conn, %{"id" => id}) do
    sale_invoice = Repo.get!(SaleInvoice, id)
    changeset = SaleInvoice.changeset(sale_invoice)
    render(conn, "edit.html", assigns(changeset, sale_invoice))
  end

  def update(conn, %{"id" => id, "sale_invoice" => sale_invoice_params}) do
    sale_invoice = Repo.get!(SaleInvoice, id)
    changeset = SaleInvoice.changeset(sale_invoice, sale_invoice_params)

    case Repo.update(changeset) do
      {:ok, sale_invoice} ->
        conn
        |> put_flash(:info, "Sale invoice updated successfully.")
        |> redirect(to: sale_invoice_path(conn, :show, sale_invoice))
      {:error, changeset} ->
        render(conn, "edit.html", assigns(changeset, sale_invoice))
    end
  end

  def delete(conn, %{"id" => id}) do
    sale_invoice = Repo.get!(SaleInvoice, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(sale_invoice)

    conn
    |> put_flash(:info, "Sale invoice deleted successfully.")
    |> redirect(to: sale_invoice_path(conn, :index))
  end
end
