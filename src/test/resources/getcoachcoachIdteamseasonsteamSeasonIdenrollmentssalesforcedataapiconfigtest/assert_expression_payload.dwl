%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "EnrollmentId": "a0m1T00000AWCXmQAP",
    "EnrollmentName": "A-010924",
    "StudentId": "0031T00004EjgC8QAJ",
    "StudentName": "Test StudentTest Student 0011",
    "FirstName": "Test",
    "LastName": "StudentTest Student 0011",
    "LastModifiedDate": "2021-08-16T20:17:35.000Z",
    "Birthdate": "2014-06-13",
    "Gender": "",
    "Ethnicity": "",
    "ZipCode": "",
    "Allergies": "Peanuts, Gluten",
    "CurrentAddress": "",
    "HomeAddress": "",
    "ParentInfoFirstName": {
      "FirstName": "Carlos",
      "LastName": "Marquez",
      "FirstPhone": "4155551213",
      "SecondPhone": "",
      "ThirdPhone": ""
    },
    "EmergencyContactInfo": {
      "Name": "Lautaro Rozen",
      "RelationshipToChild": "Uncle",
      "FirstPhone": "4155551213",
      "SecondPhone": "",
      "ThirdPhone": ""
    },
    "SecondEmergencyContactInfo": {
      "Name": "Ignacio Lopez",
      "RelationshipToChild": "Grandfather",
      "FirstPhone": "4155551212",
      "SecondPhone": "",
      "ThirdPhone": ""
    }
  }
])