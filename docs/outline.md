# Content Outline

TODO: search elixirforum for other questions

A collection of ideas around the needs of time and time display for Elixir Phoenix apps.

If you need a 

* <https://elixirschool.com/en/lessons/basics/date_time>
* [ElixirConf 2019 - Date, Time, and Time Zones in Elixir 1.9 - Lau Taarnskov](https://www.youtube.com/watch?v=_E988mvPIzU&t=510s)


The prime directive for anything time-based is to presist your date/time values in UTC. 

Out of the box, the typical Phoenix/Ecto setup will actually store `:utc_datetime` schema field in postgres without any explicit timezone, but the assumption is the whole database is is UTC. If you want to be more explicit you can.

https://speakerdeck.com/zorn/working-with-time-zones-in-an-elixir-phoenix-app?slide=33

<https://mikezornek.com/posts/2020/3/working-with-time-zones-in-an-elixir-phoenix-app/>

# Present Event times as UTC

Explicit but not very helpful to humans.

# Present event times with location-based time.

Helpful when doing something that is fully in-person, at a location and so we make the assumption.

# Present event time in the user's current time zone.

Let's say you are holding an online conference and the general marketing is that the events are in Chigago time. Since the event is online we have participants from San Fran and New York. Ideally we should present the schedule in the user's time zone.

This is a little more difficult. If you are doing the website as a traditional request response you don't (usually) have the user's time zone when rendering a response on the server. To get this, we have a few options

One way is to outright ask the user. Maybe you present the list of events in a default time zone and then let the user toggle to display as they see fit. This solution is nice in that it does not require JavaScript but can feel clunky/more mentally demanding for the user

A more common way to get the user's time zone is JavaScript with some code like the following.

This kind of code is well supported amongst browsers and should work without too much issue. 

Once you have this info you have two choices...

First you could attempt to update the DOM right there and then. 

One of the big drawbacks on leaning on front end JS to format date and time is Phoenix testing feels a little disconnected.

Two, you push this info to the server, possibly storing it in the session for future use.

Now if the pages you are presenting event info is possible to be the first page a user sees, pushing the timezone info to the server to be available in the user's session for future page renders may not be a viable choice. 

When a page is rendered WITH a known user time zone, we still look for the user time zone but do not report it to the server unless it is different 

For my own Guildflow project I did a fallback statigy, where I first looked for a user timezone, then a default group timezone.

LiveView options

Since you have a live socket connection you can do this even for the first page view.

# User Edition of Event time values

Editing brings a whole new level of challenges.

For this first section we will lean on very clunky form inputs like we see from the phoenix generators. Other input options will be explored below.

How does a user represent a single date, time, or date time. 

A start/end datetime.

Problem: Humans don't talk in timezone speak. Humans say the event will start, Saturday, Feb 23rd at 8pm or Monday, July 7th at 10:30am. They don't say Saturday, Feb 23rd at 8pm (EST) or Monday, July 7th at 10:30am (EDT).

If form params like this are coming in, how do you convert this into UTC for storage?

## Better User Forms

HTML5 date picker support.

Time picker options?

English options?

Past data influence? If you are constantly making events at 7pm -- maybe we should default that for you.













Other notable resources


* <https://github.com/lau/tzdata>
* <https://hexdocs.pm/timex/>

Working with Time Zones in an Elixir Phoenix App, Mike Zornek

https://vimeo.com/398662438