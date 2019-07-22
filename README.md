# Simple Social Network

[Link to app](https://ved-social-network.herokuapp.com)


## Features

 * **Profile:** Create, update and list profiles. The profile list is randomly generated
 on every page load. Reloading the page will (probably) load new profiles.

 * **Friends:** Non-directional connection between 2 profiles. Stored as 2 ids
 in the database. Indexed for quick read and with uniqueness for data integrity.

 Add friends by going to friends suggestions on the profile page.

 * **Friend suggestions:** List of suggestions of new friends for each profile. Add
 new friends using this page. Interesting to see that whenever you add a new friend, the friend suggestions count increases
 by 10-20.

 Currently its a list of friends of friends. Later, sort by number of mutual friends and interests

 * **Interests:** List, Create, Update, Delete interests. Associate profiles with multiple interests

 * **Seed Data:** Create profiles, interests and friendships in bulk. In a single run:

     - 10 interests, 10k profiles with random friendships and interests are created.
     - ~260k entries created with 20 parallel database connections.
     - Takes ~4 minutes to run locally, ~18min on Heroku. (This can be optimized by using SQL bulk inserts)

This can be run from the heroku dashboard. See [Deployment](#deployment) section at the bottom

But be careful to not run into Heroku database limits (and thereby get `500` errors).

## Non Features

 * **Photo Upload:** Photos cannot be uploaded to Heroku. S3 would be needed
[(ref)](https://help.heroku.com/K1PPS2WM/why-are-my-file-uploads-missing-deleted).
Currently, users can only enter URLs of photos uploaded somewhere else on the internet.

## Local Installation and Usage

Requires `ruby`, `bundler` and `postgres` to be installed.

Then, just follow standard rails installation:

```
git clone git@github.com:vedant1811/social-network.git
cd social-network
bundle install
```

Create the database:
```
$ sudo -u postgres psql
postgres=# create user rails with password 'rails';
CREATE ROLE
postgres=# alter role rails superuser createrole createdb replication;
ALTER ROLE
<CTRL+D to exit cli>

$ rails db:create
$ rails db:migrate
```

Create seed data:
```
rails profiles:seed
```

Run the server locally:
```
rails s
```

Run all the tests:
```
rails test
```

## Deployment

Deployed on **Heroku**, on the dev plan. This is limited 10k entries in the database (including connections and interests)

[Link to app](https://ved-social-network.herokuapp.com)

### Seed the database

#### Heroku CLI (Recommended)

[Install Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

```
heroku --version
heroku login
...
heroku run -a ved-social-network rails seed:profiles
```

#### Heroku dashboard

You can run the `seed:profiles` script in the heroku dashboard (but sometimes it fails halfway in the browser):

  1. Select the app
  1. More -> Run Console

Or, goto [this link](https://dashboard.heroku.com/apps/ved-social-network?web-console=ved-social-network).

Then:

  * Run `rails seed:profiles`
