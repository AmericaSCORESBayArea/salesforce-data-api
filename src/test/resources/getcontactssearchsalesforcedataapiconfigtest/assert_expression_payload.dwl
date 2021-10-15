%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "Id": "0031T00004EjgCLQAZ",
    "FirstName": "Test",
    "MiddleName": "",
    "LastName": "StudentTest Student 0024",
    "Name": "Test StudentTest Student 0024",
    "DateOfBirth": "2014-06-13",
    "Grade": "3rd"
  },
  {
    "Id": "0031T00004IVN8nQAH",
    "FirstName": "TEST STUDENT 1",
    "MiddleName": "",
    "LastName": "TEST STUDENT 1",
    "Name": "TEST STUDENT 1 TEST STUDENT 1",
    "DateOfBirth": "1980-01-01",
    "Grade": ""
  },
  {
    "Id": "0031T00004EjgC8QAJ",
    "FirstName": "Test",
    "MiddleName": "",
    "LastName": "StudentTest Student 0011",
    "Name": "Test StudentTest Student 0011",
    "DateOfBirth": "2014-06-13",
    "Grade": "3rd"
  },
  {
    "Id": "0031T00004FgmkIQAR",
    "FirstName": "ArchanaTest",
    "MiddleName": "",
    "LastName": "StudentTest Student 0012",
    "Name": "ArchanaTest StudentTest Student 0012",
    "DateOfBirth": "2011-06-13",
    "Grade": ""
  },
  {
    "Id": "0031T00004CVdT0QAL",
    "FirstName": "Student Final",
    "MiddleName": "",
    "LastName": "Santosh Test Record Do not Use",
    "Name": "Student Final Santosh Test Record Do not Use",
    "DateOfBirth": "2019-02-02",
    "Grade": ""
  }
])