%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "TeamSeasonId": "a0q1T000009q9iSQAQ",
    "SessionId": "a0p1T00000IH4S4QAL",
    "SessionName": "S-008690",
    "SessionDate": "2020-10-10",
    "SessionTopic": "Soccer"
  }
])