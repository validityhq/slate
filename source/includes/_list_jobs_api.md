# List Jobs

## List Job Result Attributes

Each List Job endpoint shares the same result attributes, below find a helpful description of what each means. Still have questions? Reach out to a <a href="mailto:red-team@validity.com?Subject=List%20Job%20API%20Help" target="_top">support representative</a>!

Parameter | Description
--------- | -----------
list_job_id | The id of the list job
name | The name of the uploaded csv for verification
status | The current stage of the list job, commonly will be one of *prepped, pending, verifying, import_error, complete, deleted*
progress | How far along in processing the list job is, in percentage
records_verified | The total number of verified records for the list job
expires_at | The expiration date of the results. After this date has passed, the results are purged and no longer accessible. BriteVerify only keeps the verified results for 7 days. Format of *MM/DD/YYYY - HH:SS AM/PM*
uploaded_at | The date on which the list job was created, in the format of *MM/DD/YYYY*
export_links | If available, a hash object including the API call to fetch the JSON result or CSV download for the list job
errors | If present, an array object that lists the error codes and messages.


## Get All List Jobs

> Successful Response

```json
{
  "current_page": 1,
  "total_pages": 5,
  "list_jobs": [
    {
        "list_job_id": "12345-12345-11111",
        "name": "test_1.csv",
        "status": "import_error",
        "progress": "0%",
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
        "progress": "100%",
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
        "progress": "100%",
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
}
```

> Unsuccessful Response

```json
{
    "current_page": 1,
    "total_pages": 1,
    "list_jobs": []
}
```

> Successful Filtered Response

```json
{
  "current_page": 1,
  "total_pages": 1,
  "list_jobs": [
    {
        "list_job_id": "83927-83634-11726",
        "name": "test_4.csv",
        "status": "pending",
        "progress": "0%",
        "records_verified": 0,
        "expires_at": null,
        "uploaded_at": "01/23/2020",
        "export_links": {}
    }
  ]
}
```

> Unsuccessful Filtered Response

```json
{
    "current_page": 1,
    "total_pages": 1,
    "list_jobs": []
}
```

This endpoint retrieves all List Jobs. By default, only 10 list jobs are returned at a single time. To return a different page, supply a `page` query param to the request. A filter can be supplied to return only List Jobs of a particular status by appending a query param of `status`.

Please see <a href="#list-job-result-attributes">Result Attributes</a> for a description of what each value represents.


### HTTP Requests

`GET https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs`


`GET https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs?status=pending`


`GET https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs?page=2`


`GET https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs?page=2&status=pending`

### Query Parameters

Parameter | Options | Description
--------- | ------- | -----------
page      | Any number | The number of the page to return, if set to less than 1, the first page is returned. If set to greater than the number of pages, the last page is returned.
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
    "progress": "100%",
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

This endpoint retrieves a specific List Job. If the list job id supplied is not valid, a *not_found* error message will be returned instead. Please see <a href="#list-job-result-attributes">Result Attributes</a> for a description of what each value represents.


### HTTP Requests

`GET https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs/143445-17885-12241`

### Query Parameters

Parameter | Description
--------- | -----------
list_job_id | The id of the list job you wish to learn more about


## Create a Contacts List Job

> Successful Response

```json
{
    "list_job_id": "19865-12235-12251",
    "name": "customers.csv",
    "status": "pending",
    "progress": "0%",
    "records_verified": 0,
    "expires_at": null,
    "uploaded_at": "01/23/2020",
    "export_links": {}
}
```

> Unsuccessful Response

```json
{
    "errors": {
        "code": "import_error",
        "message": "Missing data to verify."
    }
}
```

This endpoint creates a List Job for a list of contacts.  If a remote_url is not supplied, then a 422 indicating missing data is returned. Please see <a href="#list-job-result-attributes">Result Attributes</a> for a description of what each value represents.


### HTTP Request

`POST https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs/contacts`

### Post Body Parameters

Parameter | Description
--------- | -----------
name | Descriptive name for the job
remote_url | Location of the contacts csv

### Headers

Header | Value
--------- | -----------
Content-Type | application/json
Authorization | ApiKey: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx

## Export a List Job CSV

> Successful Response (Contacts)

```csv
email,phone,address1,address2,city,state,zip,email_status,secondary_status,email_account,email_domain,phone_status,phone_errors,phone_service_type,phone_location,address_status,address_errors,address_corrected
test_email@validity.com,5555555555,1030 West Addison Street,,Chicago,Illinois,60613,valid,disposable,test_email,validity.com,valid,,land,residential,valid,,false
test_email2@validity.com,5555555555,4 Jersey St,,Boston,Ma,02215,valid,disposable,test_email2,validity.com,valid,,land,residential,valid,,false
```

> Unsuccessful Response

```json
{
    "errors": {
        "code": "not_found",
        "message": "Completed List Job not found with supplied id."
    }
}
```

This endpoint returns verification results as csv.  If the job is not found, then a 422 indicating the job was not found.


### HTTP Request

`GET https://bfiles-2560.bv-sandbox.validity.com/api/v2/fullverify/list_jobs/:list_job_id/export`

### Query Parameters

Parameter | Description
--------- | -----------
list_job_id | Desired job for export

### Headers

Header | Value
--------- | -----------
Content-Type | application/csv
Authorization | ApiKey: 123456-123456-123456
