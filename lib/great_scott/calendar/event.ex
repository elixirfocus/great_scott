defmodule GreatScott.Calendar.Event do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "events" do
    field :ends_at, :utc_datetime
    field :starts_at, :utc_datetime
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :starts_at, :ends_at])
    |> validate_required([:title, :starts_at, :ends_at])
  end
end
