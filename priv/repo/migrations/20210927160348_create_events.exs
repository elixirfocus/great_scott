defmodule GreatScott.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :starts_at, :utc_datetime
      add :ends_at, :utc_datetime

      timestamps()
    end
  end
end
