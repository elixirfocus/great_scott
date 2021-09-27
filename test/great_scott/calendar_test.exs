defmodule GreatScott.CalendarTest do
  use GreatScott.DataCase

  alias GreatScott.Calendar

  describe "events" do
    alias GreatScott.Calendar.Event

    import GreatScott.CalendarFixtures

    @invalid_attrs %{ends_at: nil, starts_at: nil, title: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Calendar.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Calendar.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{ends_at: ~U[2021-09-26 16:03:00Z], starts_at: ~U[2021-09-26 16:03:00Z], title: "some title"}

      assert {:ok, %Event{} = event} = Calendar.create_event(valid_attrs)
      assert event.ends_at == ~U[2021-09-26 16:03:00Z]
      assert event.starts_at == ~U[2021-09-26 16:03:00Z]
      assert event.title == "some title"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Calendar.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{ends_at: ~U[2021-09-27 16:03:00Z], starts_at: ~U[2021-09-27 16:03:00Z], title: "some updated title"}

      assert {:ok, %Event{} = event} = Calendar.update_event(event, update_attrs)
      assert event.ends_at == ~U[2021-09-27 16:03:00Z]
      assert event.starts_at == ~U[2021-09-27 16:03:00Z]
      assert event.title == "some updated title"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Calendar.update_event(event, @invalid_attrs)
      assert event == Calendar.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Calendar.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Calendar.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Calendar.change_event(event)
    end
  end
end
