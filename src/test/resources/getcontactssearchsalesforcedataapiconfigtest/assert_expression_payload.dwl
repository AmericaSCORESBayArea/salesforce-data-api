%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "Id": "0031T00004FgmlQQAR",
    "FirstName": "ArchanaTest2",
    "MiddleName": "",
    "LastName": "StudentTest Student 0013",
    "DateOfBirth": "2012-06-13",
    "Grade": ""
  },
  {
    "Id": "0031T00004FgmkIQAR",
    "FirstName": "ArchanaTest",
    "MiddleName": "",
    "LastName": "StudentTest Student 0012",
    "DateOfBirth": "2011-06-13",
    "Grade": ""
  }
])