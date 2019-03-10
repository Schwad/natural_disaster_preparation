STRUCTURE

- twilio msging service
- each bolton is a service
- interactor processes incoming outgoing against a user



* MONDAY:

  - extend interactors to list. make it sweet. manage queries. screenshots for talks

* TUESDAY:
  - Get deployed and working on heroku
  - Sync up slides with features.
  - Practice what's available

* WEDNESDAY:
  - get backup of talk deployed on heroku (like laura's talk)
  - bonus features or slides about bonus features?
  - practice

* THURSDAY AM:
  - Practice


NOTES

- users
- notifications on/off


* I manually add users. Only require phone # no other information and can unsubscribe any time. (can't re: though)

MANUAL:
  - request brit headlines **
  - request queried headline **
  - turn british auto on/off
  - text based direction

AUTO:
  - get british headline


POST MVP:
  - manage a collection of queries for auto information
  - allow user to manually add themselves (see if that's accomplishable before talk)

BOLT ONS:

- News API (flesh this out before adding new adapters)
  * manual ping
  * auto ping (on/off)

  GB: https://newsapi.org/v2/top-headlines?country=gb&apiKey=5fc296ae756749138462a705f85cd805

  World
  https://newsapi.org/v2/top-headlines?country=gb&apiKey=5fc296ae756749138462a705f85cd805

- News Search
  * Get top five results headlines
    * Return number to get article and story

  https://newsapi.org/v2/everything?q=bitcoin&apiKey=5fc296ae756749138462a705f85cd805

- Text Directions
