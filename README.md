# Simple Social Network

[Link to app](https://ved-social-network.herokuapp.com)


## Features

 * **Profile:** Create, update and list profiles.

 * **Friends:** Non-directional connection between 2 profiles. Stored as 2 ids
 in the database. Indexed for quick read and with uniqueness for data integrity.

 Add friends by going to friends suggestions on the profile page.

 * **Friend suggestions:** List of suggestions of new friends for each profile. Add
 new friends using this page

 Currently its a list of friends of friends. Later, sort by number of mutual friends and interests

 * **Interests:** List, Create, Update, Delete interests. Associate profiles with multiple interests

 * **Seed Data:** Create profiles in bulk. 500 at a time, with max 20 connections each. Multiple such
background jobs can be run at the same time. Each takes ~30 seconds to run.

But be careful to not run into Heroku database limits (and thereby get `500` errors)

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

You can run the `seed:profiles` script in the heroku dashboard:

  1. Select the app
  1. More -> Run Console
  1. Run `rails seed:profiles`
