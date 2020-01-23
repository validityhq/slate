---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - json

toc_footers:
  - <a href='https://bfiles-2560.bv-sandbox.validity.com/users/sign_up' target="blank">Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the BriteVerify (BV) API Documenation. You can use this documentation to learn more about our List Job API.

# Authentication


> To incude the apikey in the body params:

```json
{
  "apikey": "123456-123456-123456"
}
```

> To incude the apikey in the headers:

```
Authorization: ApiKey: 123456-123456-123456
```

> Authorization Error

```json
{
    "errors": {
        "code": "access_denied",
        "message": "Unauthorized. Apikey invalid or missing."
    }
}
```

The BV APIs expects the apikey to be included in all API requests to the server. You can register for a new apikey [by creating an account](https://bfiles-2560.bv-sandbox.validity.com/users/sign_up). The apikey can either be in the request Header or the params body.


<aside class="notice">
You must replace <code>123456-123456-123456</code> with your personal API key.
</aside>

# List Jobs

## Get All List Jobs

> Successful Response

```json
[
    {
        "list_job_id": "12345-12345-11111",
        "name": "test_1.csv",
        "status": "import_error",
        "progess": "0%",
        "records_verified": 0,
        "expires_at": null,
        "uploaded_at": "01/22/2020",
        "export_links": {},
        "errors": [
            {
                "code": "import_error",
                "message": "Unclosed quoted field on line 2."
            }
        ]
    },
    {
        "list_job_id": "143445-17885-12241",
        "name": "test_2.csv",
        "status": "complete",
        "progess": "100%",
        "records_verified": 5,
        "expires_at": "01/29/2020 - 03:32PM",
        "uploaded_at": "01/22/2020",
        "export_links": {
            "csv": "https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs/143445-17885-12241/export",
            "json": "https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs/143445-17885-12241/results"
        }
    },
    {
        "list_job_id": "72663-98532-18761",
        "name": "test_3.csv",
        "status": "complete",
        "progess": "100%",
        "records_verified": 35,
        "expires_at": "12/19/2019 - 02:46PM",
        "uploaded_at": "12/12/2019",
        "export_links": {},
        "errors": [
            {
                "code": "expired",
                "message": "Expired. Download Unavailable."
            }
        ]
    }
  ]
```

> Unsuccessful Response
```json
[]
```

> Successful Filtered Response

```json
[
    {
        "list_job_id": "83927-83634-11726",
        "name": "test_4.csv",
        "status": "pending",
        "progess": "0%",
        "records_verified": 0,
        "expires_at": null,
        "uploaded_at": "01/23/2020",
        "export_links": {}
    }
]
```

> Unsuccessful Filtered Response

```json
[]
```

This endpoint retrieves all List Jobs. Additionally a filter can be supplied to return only List Jobs of a particular status by appending a query param of status.


### HTTP Request

`GET https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs`

### HTTP Request

`GET https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs?status=pending`

### Query Parameters

Parameter | Options | Description
--------- | ------- | -----------
status    | prepped, pending, verifying, import_error, complete, deleted | If present, the result will be filtered to only the List Jobs with the matching status. To query multiple statuses, string them together with commas.

Example Usage:

`status=verifying`
`status=pending,verifying`

### Result Attributes

Parameter | Description
--------- | -----------
list_job_id | The id of the list job
name | The name of the uploaded csv for verification
status | The current stage of the list job, commonly will be one of *prepped, pending, verifying, import_error, complete, deleted*
progess | How far along in processing the list job is, in percentage
records_verified | The total number of verified records for the list job
expires_at | The expiration date of the results. After this date has passed, the results are purged and no longer accessible. BriteVerify only keeps the verified results for 7 days. Format of *MM/DD/YYYY - HH:SS AM/PM*
uploaded_at | The date on which the list job was created, in the format of *MM/DD/YYYY*
export_links | If available, a hash object including the API call to fetch the JSON result or CSV download for the list job
errors | If present, an array object that lists the error codes and messages.


## Get a Specific List Job

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('123456-123456-123456')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('123456-123456-123456')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: 123456-123456-123456"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('123456-123456-123456');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('123456-123456-123456')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('123456-123456-123456')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: 123456-123456-123456"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('123456-123456-123456');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

