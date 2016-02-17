defmodule BasicBooks.SaleInvoiceControllerTest do
  use BasicBooks.ConnCase

  alias BasicBooks.SaleInvoice
  @valid_attrs %{reference: "some content", is_credit_note: true, invoice_date: "2010-04-17 14:00:00", paid_date: "2010-04-17 14:00:00", po_number: "some content", resolved_corp: true, resolved_vat: true}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, sale_invoice_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing sale invoices"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, sale_invoice_path(conn, :new)
    assert html_response(conn, 200) =~ "New sale invoice"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, sale_invoice_path(conn, :create), sale_invoice: @valid_attrs
    assert redirected_to(conn) == sale_invoice_path(conn, :index)
    assert Repo.get_by(SaleInvoice, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, sale_invoice_path(conn, :create), sale_invoice: @invalid_attrs
    assert html_response(conn, 200) =~ "New sale invoice"
  end

  test "shows chosen resource", %{conn: conn} do
    sale_invoice = Repo.insert! %SaleInvoice{}
    conn = get conn, sale_invoice_path(conn, :show, sale_invoice)
    assert html_response(conn, 200) =~ "Show sale invoice"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, sale_invoice_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    sale_invoice = Repo.insert! %SaleInvoice{}
    conn = get conn, sale_invoice_path(conn, :edit, sale_invoice)
    assert html_response(conn, 200) =~ "Edit sale invoice"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    sale_invoice = Repo.insert! %SaleInvoice{}
    conn = put conn, sale_invoice_path(conn, :update, sale_invoice), sale_invoice: @valid_attrs
    assert redirected_to(conn) == sale_invoice_path(conn, :show, sale_invoice)
    assert Repo.get_by(SaleInvoice, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    sale_invoice = Repo.insert! %SaleInvoice{}
    conn = put conn, sale_invoice_path(conn, :update, sale_invoice), sale_invoice: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit sale invoice"
  end

  test "deletes chosen resource", %{conn: conn} do
    sale_invoice = Repo.insert! %SaleInvoice{}
    conn = delete conn, sale_invoice_path(conn, :delete, sale_invoice)
    assert redirected_to(conn) == sale_invoice_path(conn, :index)
    refute Repo.get(SaleInvoice, sale_invoice.id)
  end
end
