# List Jobs

## Common Result Attributes

Each List Job endpoint shares the same result attributes, below find a helpful description of what each means. Still have questions? Reach out to a <a href="mailto:red-team@validity.com?Subject=List%20Job%20API%20Help" target="_top">support representative</a>!

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

This endpoint retrieves all List Jobs. Additionally a filter can be supplied to return only List Jobs of a particular status by appending a query param of status. Please see <a href="#common-result-attributes">Result Attributes</a> for a description of what each value represents.


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


## Get a Specific List Job

> Successful Response

```json
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
}
```

> Unsuccessful Response

```json
{
    "errors": {
        "code": "not_found",
        "message": "List Job not found with supplied id."
    }
}
```

This endpoint retrieves a specific List Job. If the list job id supplied is not valid, a *not_found* error message will be returned instead. Please see <a href="#common-result-attributes">Result Attributes</a> for a description of what each value represents.


### HTTP Request

`GET https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs/:list_job_id`


`GET https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs/143445-17885-12241`

### Query Parameters

Parameter | Description
--------- | -----------
list_job_id | The id of the list job you wish to learn more about
