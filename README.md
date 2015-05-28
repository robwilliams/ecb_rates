# ECB Rates

Fetches the latest euro exchange rates from the European Central Bank and provides it in a json format.

## API Usage

The euro exchange rates can be accessed at `/latest.json` which will return the following:

```json
{
  "base":"EUR",
  "updated_at":"2015-05-28T16:17:59Z",
  "rates":{
    "EUR":"1.0",
    "USD":"1.0896",
    "JPY":"135.36",
    // ...
  }
}
```

The exchange rates can be rebased against another currency by passing a base currency `/latest.json?base=GBP`

```json
  {
    "base":"GBP",
    "updated_at":"2015-05-28T16:19:55Z",
    "rates":{
      "GBP":"1.0",
      "EUR":"1.40371",
      "USD":"1.52948",
      // ...
    }
  }
```
