# README

## Introduction and Quick-Start

This app, named James Webb App, is (facetiously) the successor to the Hubble
app.

To get it running, create the database, run migrations, get transaction data
(just NEAR token data for now), fire up the server, and visit
http://localhost:3000/.

```bash
  rake db:create
  rake db:migrate
  rake get_transactions
  rails s
```

## Requirements

This endpoint returns example transactions data for the Near blockchain network:

http://figment-mock-data.figment.network/near/transactions?api_key=SECRET_API_KEY

Create a simple web app that uses the above endpoint to show a dashboard with:
  1.  a table with all successful transfers, oldest first (use "time" attribute),
      with these fields: sender, receiver, height and deposit
  2.  average gas burnt for last 30 transactions (skip it if this exercise takes
      you more than 2h)
  3. current time

Additional information:
- no need for styling or pagination
- Near token has a scale factor of 24, so for example deposit of
  716669915088987500000000000 should be displayed as 716.6699150889875 NEAR.
  Don't scale gas
- the above endpoint will work without an API key, but assume it's required

## Caveats

I created a simple Rails app for the requirements. The app uses a rake task
(`rake get_transactions`) to get the data from the API. I assume this rake task
can be run using a scheduler such as `cron` on regular time intervals.

Examining the data, I saw that each transaction may have multiple actions. In
one case, a transaction had two actions, with one having a deposit of zero and
the other transactions having a deposit of more than zero. I assume that only
the non-zero deposit should be counted. However, for the sake of this exercise,
I added a comment to refactor the code to account for this, and took just the
first action.

For the requirement to count the average gas burnt for last 30 transactions, I
assumed:
  1. only successful transactions should count, and
  2. only non-zero burnt gas transactions should count.

I am happy to change this code if the assumptions are false.

## Areas for Further Improvement

I assume this app would need to show the time the data is last fetched, to
compare to the current time. Also, one could add a button to refresh the data.
In the `get_transactions` task, I use `upsert` (create or update) to allow the
data to be either created or updated. However, I did not use the provided `id`
attribute, since that ID would be token-specific (in my assumption). This can
be refactored or improved depending on further requirements.
