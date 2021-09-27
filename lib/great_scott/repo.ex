defmodule GreatScott.Repo do
  use Ecto.Repo,
    otp_app: :great_scott,
    adapter: Ecto.Adapters.Postgres
end
