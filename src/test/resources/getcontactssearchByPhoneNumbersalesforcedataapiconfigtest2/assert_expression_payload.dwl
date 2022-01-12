%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "Id": "0031T00003d3qWfQAI",
    "FirstName": "A. Giovany",
    "MiddleName": "",
    "LastName": "Uc",
    "Name": "A. Giovany Uc",
    "DateOfBirth": "2009-01-01",
    "Grade": "6th",
    "ParentPhone01": "(415)964- 6867"
  }
])