%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "Id": "0031T00004CZcaDQAT",
    "FirstName": "Edgar Cayetano",
    "MiddleName": "",
    "LastName": "Puz",
    "Name": "Edgar Cayetano Puz",
    "DateOfBirth": "2009-07-02",
    "Grade": "",
    "ParentPhone01": "510-395-3624"
  },
  {
    "Id": "0031T00004CZca4QAD",
    "FirstName": "Alexander",
    "MiddleName": "",
    "LastName": "Puz Delton",
    "Name": "Alexander Puz Delton",
    "DateOfBirth": "2010-09-07",
    "Grade": "",
    "ParentPhone01": "510-395-3624"
  }
])