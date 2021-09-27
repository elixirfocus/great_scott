defmodule GreatScott.CalendarFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GreatScott.Calendar` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        ends_at: ~U[2021-09-26 16:03:00Z],
        starts_at: ~U[2021-09-26 16:03:00Z],
        title: "some title"
      })
      |> GreatScott.Calendar.create_event()

    event
  end
end
