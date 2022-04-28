from pymongo import MongoClient



connectionString="mongodb+srv://sinbad:SunWood4117@cluster0.tz6ko.mongodb.net/blog?retryWrites=true&w=majority"
cluster = MongoClient(connectionString)
db = cluster["books"]
collection = db["books"]


collection.insert_many([
	{
		"isbn" : 978157965,
		"title" : "The French Laundry",
		"Author" : "Thomas Keller",
		"date" : {"year": 1999,
				  "month": "September"},
		"tags" : [
			"Cooking"
		]
	},{
		"isbn" : 9781607745945,
		"title" : "A New Napa Cuisine",
		"Author" : "Christopher Kostow",
		"date" : {"year": 2014,
				 "month": "June"},
		"tags": [
			"Cooking"]
	},{
		"isbn": 10060585366 ,
		"title" : "The Whole Beast",
		"Author" : "Fergus Henderson",
		"date" : {"year": 2004,
				  "month": "May"},
		"tags" : [
			"Cooking"
		]
	},{
		"isbn" : 1584503262,
		"title" : "Practical Java Game Programming",
		"Author" : "Dustin Clingman",
		"date" : {"year": 2004,
				  "month": "February"},
		"tags" : [
			"Programming"
		]
	},{
		"isbn" : 10399128964,
		"title" : "Dune",
		"Author" : "Frank Herbert",
		"date" : {"year": 1984,
				  "month": "August"},
		"tags" : [
			"Sci-fi"
		]
	},
])
for books in collection.find():
	print(books)