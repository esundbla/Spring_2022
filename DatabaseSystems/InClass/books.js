use books

db.books.insertMany([
    {
		"isbn" : 978157965,
		"title" : "The French Laundry",
		"Author" : "Thomas Keller",
		"date" : {"year": 1999,
				  "month": "September"},
		"pages": 562,
		"tags" : [
			"Cooking"
		]
	},{
		"isbn" : 9781607745945,
		"title" : "A New Napa Cuisine",
		"Author" : "Christopher Kostow",
		"date" : {"year": 2014,
				 "month": "June"},
		"pages": 97,
		"tags": [
			"Cooking"]
	},{
		"isbn": 10060585366 ,
		"title" : "The Whole Beast",
		"Author" : "Fergus Henderson",
		"date" : {"year": 2004,
				  "month": "May"},
		"pages": 127,
		"tags" : [
			"Cooking"
		]
	},{
		"isbn" : 1584503262,
		"title" : "Practical Java Game Programming",
		"Author" : "Dustin Clingman",
		"date" : {"year": 2004,
				  "month": "February"},
		"pages": 425,
		"tags" : [
			"Programming"
		]
	},{
		"isbn" : 10399128964,
		"title" : "Dune",
		"Author" : "Frank Herbert",
		"date" : {"year": 1984,
				  "month": "August"},
		"pages": 387,
		"tags" : [
			"Sci-fi"
		]
	},
])

db.books.find()

db.books.find( {'title': {"$regex": ".*"}}, {'title': 1, '_id': 0})

db.books.find({'Author' : 'Thomas Keller'},
		{'title':1, "_id":0, "Author":1})

db.books.find({'date.year':2004},
		{'title':1, "_id":0, "date.year":1})

db.books.find({'$and': [
		{'pages':{'$gte':100}}, {'pages':{"$lte":500}}]},
		{'title':1, "_id":0, "pages":1})