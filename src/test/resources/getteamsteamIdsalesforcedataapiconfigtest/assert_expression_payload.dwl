%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "TeamName": "ASCEND Girls",
    "TeamId": "a1N1T000005wL4GUAU"
  }
])