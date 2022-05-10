
from pymongo import MongoClient
import json

connectionString="mongodb+srv://sinbad:SunWood4117@cluster0.tz6ko.mongodb.net/companies?retryWrites=true&w=majority"
cluster = MongoClient(connectionString)
db = cluster["companies"]
collection = db["companies"]
f = open("C:/Users/13039/Documents/GitHub/22SCS3810/activity_19_companies/companies.json")
inserts = json.load(f)

for items in inserts:
    del items['_id']
    collection.insert_one(items)

