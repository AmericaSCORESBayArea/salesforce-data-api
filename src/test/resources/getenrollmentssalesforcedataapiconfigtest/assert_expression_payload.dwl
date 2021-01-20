%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "EnrollmentId": "a0m1T00000A2cr7QAB",
    "EnrollmentName": "A-006798",
    "TeamSeasonId": "a0q1T000009q9iSQAQ",
    "StudentId": "0031T00003UDuq4QAD",
    "StudentName": "Evelyn Diaz Aleman",
    "FirstName": "Evelyn",
    "LastName": "Diaz Aleman",
    "Birthdate": "2010-10-04",
    "Gender": "Female",
    "Ethnicity": "Hispanic/Latino",
    "ZipCode": "94124"
  },
  {
    "EnrollmentId": "a0m1T00000A2cr9QAB",
    "EnrollmentName": "A-006800",
    "TeamSeasonId": "a0q1T000009q9iSQAQ",
    "StudentId": "0031T00003UDuq3QAD",
    "StudentName": "Yaky Rodriguez",
    "FirstName": "Yaky",
    "LastName": "Rodriguez",
    "Birthdate": "2011-08-05",
    "Gender": "Female",
    "Ethnicity": "Hispanic/Latino",
    "ZipCode": "94112"
  },
  {
    "EnrollmentId": "a0m1T00000A2crCQAR",
    "EnrollmentName": "A-006803",
    "TeamSeasonId": "a0q1T000009q9iSQAQ",
    "StudentId": "0031T00003UDuq2QAD",
    "StudentName": "Dolly Chiguila",
    "FirstName": "Dolly",
    "LastName": "Chiguila",
    "Birthdate": "2009-03-21",
    "Gender": "Female",
    "Ethnicity": "Hispanic/Latino",
    "ZipCode": "94112"
  }
])