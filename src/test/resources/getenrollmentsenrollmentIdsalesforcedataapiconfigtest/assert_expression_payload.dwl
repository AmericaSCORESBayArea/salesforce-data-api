%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
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
})