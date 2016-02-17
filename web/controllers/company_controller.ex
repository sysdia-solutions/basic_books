defmodule BasicBooks.CompanyController do
  use BasicBooks.Web, :controller

  alias BasicBooks.Company
  alias BasicBooks.Term
  alias BasicBooks.Contact

  plug :scrub_params, "company" when action in [:create, :update]

  defp preload_all(data) do
    data
    |> Repo.preload([:term])
    |> Repo.preload([:contact])
  end

  defp assigns(changeset, record \\ nil) do
    terms = collection_enum(Term, :name)
    contacts = collection_enum(Contact,:name)

    [
      company: record,
      changeset: changeset,
      terms: terms,
      contacts: contacts
    ]
  end

  def index(conn, _params) do
    companies = Repo.all(Company)
                |> preload_all()
    render(conn, "index.html", companies: companies)
  end

  def new(conn, _params) do
    changeset = Company.changeset(%Company{})
    render(conn, "new.html", assigns(changeset))
  end

  def create(conn, %{"company" => company_params}) do
    changeset = Company.changeset(%Company{}, company_params)

    case Repo.insert(changeset) do
      {:ok, _company} ->
        conn
        |> put_flash(:info, "Company created successfully.")
        |> redirect(to: company_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", assigns(changeset))
    end
  end

  def show(conn, %{"id" => id}) do
    company = Repo.get!(Company, id)
              |> preload_all()
    render(conn, "show.html", company: company)
  end

  def edit(conn, %{"id" => id}) do
    company = Repo.get!(Company, id)
    changeset = Company.changeset(company)
    render(conn, "edit.html", assigns(changeset, company))
  end

  def update(conn, %{"id" => id, "company" => company_params}) do
    company = Repo.get!(Company, id)
    changeset = Company.changeset(company, company_params)

    case Repo.update(changeset) do
      {:ok, company} ->
        conn
        |> put_flash(:info, "Company updated successfully.")
        |> redirect(to: company_path(conn, :show, company))
      {:error, changeset} ->
        render(conn, "edit.html", assigns(changeset, company))
    end
  end

  def delete(conn, %{"id" => id}) do
    company = Repo.get!(Company, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(company)

    conn
    |> put_flash(:info, "Company deleted successfully.")
    |> redirect(to: company_path(conn, :index))
  end
end
