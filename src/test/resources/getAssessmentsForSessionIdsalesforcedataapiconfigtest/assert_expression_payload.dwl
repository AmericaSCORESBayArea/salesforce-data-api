%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
    {
        "Id": "a0k53000000IMInAAO",
        "FirstName": "Test",
        "LastName": "StudentTest Student 0024",
        "AssessmentResponse": "8",
        "AssessmentType": "PACER",
        "StudentId": "0031T00004EjgCLQAZ",
        "SessionId": "a0p530000000B18AAE",
        "LastModified": "2020-02-04"
    },
    {
        "Id": "a0k53000000IMIiAAO",
        "FirstName": "Test",
        "LastName": "StudentTest Student 0011",
        "AssessmentResponse": "2",
        "AssessmentType": "PACER",
        "StudentId": "0031T00004EjgC8QAJ",
        "SessionId": "a0p530000000B18AAE",
        "LastModified": "2020-02-01"
    },
    {
        "Id": "a0k53000000IUDgAAO",
        "FirstName": "Test",
        "LastName": "StudentTest Student 0011",
        "AssessmentResponse": "happy",
        "AssessmentType": "Activity_Feedback",
        "StudentId": "0031T00004EjgC8QAJ",
        "SessionId": "a0p530000000B18AAE",
        "LastModified": "2020-02-02"
    }
])