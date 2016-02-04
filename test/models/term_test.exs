defmodule BasicBooks.TermTest do
  use BasicBooks.ModelCase

  alias BasicBooks.Term

  @valid_attrs %{days: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Term.changeset(%Term{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Term.changeset(%Term{}, @invalid_attrs)
    refute changeset.valid?
  end
end
