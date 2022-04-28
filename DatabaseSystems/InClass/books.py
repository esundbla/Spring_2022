from pymongo import MongoClient



connectionString="mongodb+srv://sinbad:SunWood4117@cluster0.tz6ko.mongodb.net/blog?retryWrites=true&w=majority"
cluster = MongoClient(connectionString)
db = cluster["books"]
collection = db["books"]


collection.insert_many([
	{
		"isbn" : 123456,
		"title" : "The French Laundry",
		"Author" : "Thomas Keller",
		"date" : {"year": 1997,
				  "month": "September"},
		"tags" : [
			"Cooking"
		]
	},
	{
		"isbn": 123456,
		"title": "The French Laundry",
		"Author": "Thomas Keller",
		"date": {"year": 1997,
				 "month": "September"},
		"tags": [
			"Cooking"
		]
	},{
		"isbn" : 123456,
		"title" : "The French Laundry",
		"Author" : "Thomas Keller",
		"date" : {"year": 1997,
				  "month": "September"},
		"tags" : [
			"Cooking"
		]
	},{
		"isbn" : 123456,
		"title" : "The French Laundry",
		"Author" : "Thomas Keller",
		"date" : {"year": 1997,
				  "month": "September"},
		"tags" : [
			"Cooking"
		]
	},{
		"isbn" : 123456,
		"title" : "The French Laundry",
		"Author" : "Thomas Keller",
		"date" : {"year": 1997,
				  "month": "September"},
		"tags" : [
			"Cooking"
		]
	},
])
for books in collection.find():
	print(books)