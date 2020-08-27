%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "Message": "Attendance taken",
  "Attendance_Taken": true
})