# Accounts

## Account Result Attributes

Each Accounts endpoint shares the same result attributes, below find a helpful description of what each means. Still have questions? Reach out to a <a href="mailto:red-team@validity.com?Subject=List%20Job%20API%20Help" target="_top">support representative</a>!

Parameter | Description
--------- | -----------
account_id | The id of the account
email | The email associated with the account
fullname | The first and last name associated to the account
company | The company name associated to the account
apikey | The apikey beloning to the account. Used for API calls, such as to the List Jobs API


## Get Account

> Successful Response

```json
{
    "account_id": "47777-98438-22245",
    "email": "moose_test@example.com",
    "fullname": "Mighty Moose",
    "company": "Might Moose LLC",
    "apikey": "123456-123456-123456"
}
```

> Unsuccessful Response

```json
{
    "errors": [
        {
            "code": "not_found",
            "message": "Account not found with supplied id."
        }
    ]
}
```

This endpoint retrieves a specific Account by account id. Please see <a href="#account-result-attributes">Result Attributes</a> for a description of what each value represents.


### HTTP Requests

`GET https://bfiles-2560.bv-sandbox.validity.com/api/v2/accounts/47777-98438-22245`


## Create Account

> Successful Response

```json
{
    "account_id": "47777-98438-22245",
    "email": "moose_test@example.com",
    "fullname": "Mighty Moose",
    "company": "Might Moose LLC",
    "apikey": "123456-123456-123456"
}
```

> Unsuccessful Response

```json
{
    "errors": [
        {
            "code": "already_exists",
            "message": "An account with supplied email already exists."
        }
    ]
}
```


```json
{
    "errors": [
        {
            "code": "create_error",
            "message": "User must exist"
        }
    ]
}
```

```json
{
    "errors": [
        {
            "code": "already_exists",
            "message": "An account with supplied email already exists."
        }
    ]
}
```

This endpoint creates an Account for a new email address. Only one account can be created per email address.


### HTTP Request

`POST https://bfiles-2560.bv-sandbox.validity.com/api/v2/accounts`

### Post Body Parameters

Parameter | Description
--------- | -----------
email | The email to create the account with
fullname | The first and last name of the account owner
company | The company name belonging to the account


### Headers

Header | Value
--------- | -----------
Content-Type | application/json
