# MC Technical Assignment

## Note

- A good amounts of seeds.
- Everything is formatted with Rubocop with lots of extensions.
- Everything is in services (using Go-like error handling).
- Lots of tests. Check them for usage examples.
- No N+1 queries.
- The `role` column isn't in the `players` table, but in the `match_performances` table instead, which accounts for a player switching roles during their career.
- Etc.

## Bonus points

- Pagination is supported.
- Rating retrieval is cached.
- Rating is calculated asynchronously.

## Install

```sh
# Initialize the databases.
docker compose --file docker-compose.dev.yml run app bundle exec rails db:create db:migrate db:seed

# Start the application.
docker compose --file docker-compose.dev.yml up
```
