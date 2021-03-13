%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "Message": "Conflict detected. Matching contacts found",
  "Contacts": [
    {
      "Id": "0032i00000jynM6AAI",
      "FirstName": "Archana",
      "LastName": "Llamas",
      "Status": "",
      "DateOfBirth": "2020-09-13",
      "HousingStatus": "",
      "StreetAddress": "",
      "City": "",
      "State": "",
      "Zip": "0",
      "HomeLanguage": "",
      "Ethnicity": "",
      "Gender": "",
      "EducationalAttainment": "",
      "SchoolAttending": "",
      "SchoolEntryDate": "",
      "SFUSDEntryDate": "",
      "K12GradeLevel": ""
    }
  ]
})