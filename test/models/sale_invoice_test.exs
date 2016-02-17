defmodule BasicBooks.SaleInvoiceTest do
  use BasicBooks.ModelCase

  alias BasicBooks.SaleInvoice

  @valid_attrs %{reference: "some content", is_credit_note: true, invoice_date: "2010-04-17 14:00:00", invoice_number: "some content", paid_date: "2010-04-17 14:00:00", po_number: "some content", resolved_corp: true, resolved_vat: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SaleInvoice.changeset(%SaleInvoice{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SaleInvoice.changeset(%SaleInvoice{}, @invalid_attrs)
    refute changeset.valid?
  end
end
