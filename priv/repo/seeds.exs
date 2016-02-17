# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BasicBooks.Repo.insert!(%BasicBooks.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#

BasicBooks.Repo.insert!(%BasicBooks.Term{name: "On Receipt", days: 0})
BasicBooks.Repo.insert!(%BasicBooks.Term{name: "30 Days", days: 30})
BasicBooks.Repo.insert!(%BasicBooks.Term{name: "60 Days", days: 60})
BasicBooks.Repo.insert!(%BasicBooks.Term{name: "120 Days", days: 120})

BasicBooks.Repo.insert!(%BasicBooks.Payment{name: "Cash"})
BasicBooks.Repo.insert!(%BasicBooks.Payment{name: "Cheque"})
BasicBooks.Repo.insert!(%BasicBooks.Payment{name: "Credit Card"})
BasicBooks.Repo.insert!(%BasicBooks.Payment{name: "Bank Transfer"})
BasicBooks.Repo.insert!(%BasicBooks.Payment{name: "BACS"})
