defmodule BasicBooks.CompanyView do
  use BasicBooks.Web, :view

  def terms_for_select(terms) do
    terms
    |> Enum.map(&["#{&1.name}": &1.id])
    |> List.flatten
  end
end
