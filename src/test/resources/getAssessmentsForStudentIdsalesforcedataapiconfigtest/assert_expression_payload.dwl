%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
    {
        "Id": "a0k53000000IMInAAO",
        "AssessmentResponse": "8",
        "AssessmentType": "PACER",
        "SessionId": "a0p1T00000GIXJ4QAP",
        "LastModified": "2020-02-04"
    },
    {
        "Id": "a0k53000000ICh2AAG",
        "AssessmentResponse": "5",
        "AssessmentType": "PACER",
        "SessionId": "a0p1T00000GIXJ4QAP",
        "LastModified": "2020-02-01"
    },
    {
        "Id": "a0k53000000IUDgAAO",
        "AssessmentResponse": "happy",
        "AssessmentType": "Activity_Feedback",
        "SessionId": "a0p1T00000GIXJ4QAP",
        "LastModified": "2020-02-02"
    }
])