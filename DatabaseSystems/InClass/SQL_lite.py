import sqlite3


conn = sqlite3.connect('hr.db')
with open('hr.sql') as f:
    conn.executescript(f.read())
conn.commit()
cur = conn.cursor()
sql = "SELECT * FROM Employees"
cur.execute(sql)
for row in cur.fetchall():
    print(row)
conn.close