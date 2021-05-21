%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "SeasonStartDate": "2021-01-01",
    "TotalNoOfSessions": "72.0",
    "CoachWriting": "Ignacio Test Coach",
    "Partnership": "",
    "SeasonName": "2021 Spring",
    "TotalNoOfPlayers": "21.0",
    "TeamSeasonName": "Developer Test Team-2021 Spring",
    "CoachSoccer": "Pete-Coach Tester",
    "TeamSeasonId": "a0q1T000009sASPQA2",
    "TeamName": "Developer Test Team",
    "SchoolSite": "Test School",
    "SeasonEndDate": "2021-06-01",
    "ScoresProgramManager": "Pete-Coach Tester",
    "ProgramCoordinator": "Pete-Coach Tester",
    "Region": "Oakland",
    "SeasonId": "a0o1T000005n5TmQAI"
  },
  {
    "SeasonStartDate": "2016-09-01",
    "TotalNoOfSessions": "24.0",
    "CoachWriting": "Ignacio Test Coach",
    "Partnership": "",
    "SeasonName": "2016 Fall",
    "TotalNoOfPlayers": "21.0",
    "TeamSeasonName": "Developer Test Team-2016 Fall",
    "CoachSoccer": "Pete-Coach Tester",
    "TeamSeasonId": "a0q1T000009rQoVQAU",
    "TeamName": "Developer Test Team",
    "SchoolSite": "Test School",
    "SeasonEndDate": "2016-12-31",
    "ScoresProgramManager": "Pete-Coach Tester",
    "ProgramCoordinator": "Pete-Coach Tester",
    "Region": "Oakland",
    "SeasonId": "a0o1T000005QRTnQAO"
  }
])