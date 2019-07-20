# Simple Social Network


## Features

 * Profile

 * **Connections:** Non-directional connection between 2 profiles

 * **Interests**

 * **Admin Dashboard**:

  - Create profiles in bulk. 10k at a time.
  - Visiualize people and connections

## Non Features

 * **Photo Upload:** Photos cannot be uploaded to Heroku. S3 would be needed
[(ref)](https://help.heroku.com/K1PPS2WM/why-are-my-file-uploads-missing-deleted).
Currently, users can only enter URLs of photos uploaded somewhere else on the internet.

## Deployment

Deployed on **Heroku**.

Uses Heroku [caching](https://devcenter.heroku.com/articles/building-a-rails-3-application-with-memcache)
and [background jobs](https://devcenter.heroku.com/articles/background-jobs-queueing)
