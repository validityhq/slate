---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - json

toc_footers:
  - <a href='https://bfiles-2560.bv-sandbox.validity.com/users/sign_up' target="blank">Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - list_jobs_api
  - accounts_api
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

> Basic Auth

```json
username: testaccount_username
password: 3938383-3938373-209292822

```

There are two type of authorizarion required by the BV APIs. For actions belonging to an account, ie. List Jobs API, follow the apikey method. For actions taken before an apikey is created, ie. Accounts API, follow the basic auth method.

The BV APIs regarding an account's actions expect the apikey to be included in all API requests to the server. You can register for a new apikey [by creating an account](https://bfiles-2560.bv-sandbox.validity.com/users/sign_up) or through the [Accounts API](#create-account). The apikey can either be in the request Header or the params body.

The BV Accounts API expects every request to be sent with Basic Auth, meaning a username and password is supplied. Credentials for this api can be supplied by contacting a <a href="mailto:red-team@validity.com?Subject=List%20Job%20API%20Help" target="_top">support representative</a>.


<aside class="notice">
You must replace <code>123456-123456-123456</code> with your personal API key.
</aside>


<aside class="notice">
You must replace <code>testaccount_username</code> and <code>3938383-3938373-209292822</code> with your personal credentials.
</aside>
