%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "created": false,
    "success": true,
    "id": "a0l2i000000G3IIAA0",
    "errors": []
  },
  {
    "created": false,
    "success": true,
    "id": "a0l2i000000G3INAA0",
    "errors": []
  },
  {
    "created": false,
    "success": true,
    "id": "a0l2i000000G3IOAA0",
    "errors": []
  }
])