# Reggae on Rails

This project is a rewrite of [reggae-cdmx.com](https://github.com/FlowFX/reggae-cdmx.com)
using Ruby on Rails instead of Python and Django. The reason for this can be found
[here](https://flowfx.de/blog/moving-back-to-germany/).

The current status is very much **under development**.

## Initial Specification
There are two types of users: Readers and Staff.

### Readers
The Reader goes to https://reggae-cdmx.com/ looking for a cool Reggae event this coming weekend. On the home page she sees a  list of all future events in the city. When she clicks on one of the events, she gets presented with the details page of that event. It shows all available information, including the event name, description, venue, date and time and ideally the event flyer.

### Staff
A staff member adds, edits and deletes events. When she clicks the **Add Event** button, she gets presented a web form with input fields for all the information that will be shown on the event detail page (cf. Readers). She can also add and edit the venues that are associated with events.

## Installation

```bash
git clone git@github.com:FlowFX/reggae-on-rails.git reggae-on-rails
cd reggae-on-rails
bundle install
rails db:migrate
rails db:seed
rails test
```
