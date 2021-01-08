%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "message": "Unable to create/update fields: Team_Season__c. Please check the security settings of this field and verify that it is read/write for your profile or permission set."
})