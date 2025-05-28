import csv

memo_true = set()
with open('./data/sessions-from-attendances/true.csv', newline='') as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        memo_true.add(row[0])


memo_false = set()
with open('./data/sessions-from-attendances/false.csv', newline='') as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        memo_false.add(row[0])

print(len(memo_false))
print(len(memo_true))
result = []
for item in memo_false:
    if item in memo_true:
        continue
    else:
        result.append(item)

print(len(result))
print(result)
