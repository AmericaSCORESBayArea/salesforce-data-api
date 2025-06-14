import csv
import asyncio
import aiohttp
import ssl

ssl_context = ssl.create_default_context()
ssl_context.check_hostname = False
ssl_context.verify_mode = ssl.CERT_NONE

with open('./data/attendance-task/results.csv', newline='') as csvfile:
    reader = csv.reader(csvfile)
    counter = 0
    total_coutner = 0
    memo = {}
    for row in reader:
        if total_coutner == 0:
            total_coutner += 1
            continue

        sessionId = row[0]
        if sessionId == "a0pcX0000005lZNQAY":
            continue
        coach1 = row[4]
        coach2 = row[5]
        attendanceDate = row[6]
        memo[sessionId] = (coach1, coach2, attendanceDate)

        total_coutner += 1


    # reader = csv.reader(csvfile)
    # print(f"Total coach mismatches: {counter}")
    # print(f"Total records: {total_coutner}")
    async def send_post_request(http_session, session, coach, endOfTeamSeason):
        url = "https://localhost:8091/api/tasks"
        headers = {
            'Content-Type': 'application/json'
        }
        payload = {
                "AssignedBy": "",
                "AssignedTo": coach,
                "CreatedByContact": "0051T000009eHfvQAE",
                "CreatedContact": "",
                "LastModifiedBy": "0051T000009eHfvQAE",
                "LastModifiedContact": "",
                "OwnerId": "0051T000009eHfvQAE",
                "DueDate": endOfTeamSeason,
                "Session": session,
                "Name": "Catch-up attendance",
                "TaskStatus": "Not Started",
                "TaskType": "Take Attendance"
            }

        try:
            async with http_session.post(url, headers=headers, json=payload, ssl=ssl_context) as response:
                return await response.text(), response.status
        except Exception as e:
            print(e)
            return None, None

    async def main():
        async with aiohttp.ClientSession() as http_session:
            for session_id, (coach1, coach2, end_of_team_season) in memo.items():
                print(f"Processing session {session_id} with coaches {coach1} and {coach2} ({end_of_team_season})")
                if coach1 == coach2:
                    resp = await send_post_request(http_session, session_id, coach1, end_of_team_season)
                    print(resp)
                else:
                    resp1 = await send_post_request(http_session, session_id, coach1, end_of_team_season)
                    print(resp1)
                    resp2 = await send_post_request(http_session, session_id, coach2, end_of_team_season)
                    print(resp2)
                print(f"------------------------------------------------------------------------------------------")

    asyncio.run(main())
