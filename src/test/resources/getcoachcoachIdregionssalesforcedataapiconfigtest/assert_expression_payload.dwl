%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "Region": "IFC-SF"
  },
  {
    "Region": "San Jose"
  }
])