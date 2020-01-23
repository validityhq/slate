---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - json

toc_footers:
  - <a href='https://bfiles-2560.bv-sandbox.validity.com/users/sign_up' target="blank">Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - list_jobs_api
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
