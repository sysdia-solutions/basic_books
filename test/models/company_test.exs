defmodule BasicBooks.CompanyTest do
  use BasicBooks.ModelCase

  alias BasicBooks.Company

  @valid_attrs %{address: "some content", company_number: 42, name: "some content",  country: "some content", is_customer: true, is_supplier: true, post_code: "some content", town: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Company.changeset(%Company{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Company.changeset(%Company{}, @invalid_attrs)
    refute changeset.valid?
  end
end
