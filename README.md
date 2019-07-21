# Simple Social Network


## Features

 * Profile

 * **Connections:** Non-directional connection between 2 profiles. Stored as 2 ids
 in the database. Indexed for quick read and with uniqueness for data integrity.

 * **Interests**

 * **Admin Dashboard**:

    - Create profiles in bulk. 100 at a time, with max 20 connections each. Multiple such
    background jobs can be run at the same time.
    - Visiualize people and connections

## Non Features

 * **Photo Upload:** Photos cannot be uploaded to Heroku. S3 would be needed
[(ref)](https://help.heroku.com/K1PPS2WM/why-are-my-file-uploads-missing-deleted).
Currently, users can only enter URLs of photos uploaded somewhere else on the internet.

## Deployment

Deployed on **Heroku**, on the dev plan. This is limited 10k entries in the database (including connections and interests)

Uses Heroku [caching](https://devcenter.heroku.com/articles/building-a-rails-3-application-with-memcache)
and [background jobs](https://devcenter.heroku.com/articles/background-jobs-queueing)
