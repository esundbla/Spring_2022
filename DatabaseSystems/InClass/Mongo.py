from pymongo import MongoClient



connectionString="mongodb+srv://sinbad:SunWood4117@cluster0.tz6ko.mongodb.net/blog?retryWrites=true&w=majority"
cluster = MongoClient(connectionString)
db = cluster["books"]
collection = db["books"]

collection.insert_many([

{
	"author" : "Sam Mai Tai",
	"created_at" : ("2017-11-03T09:30:00Z"),
	"content" : "Age is a case of mind over matter. If you don't mind, it don't matter.",
	"likes" : 10,
	"tags" : [
		"age",
		"optimist"
	]
},

{
	"author" : "Sam Mai Tai",
	"created_at" : ("2017-11-04T00:00:00Z"),
	"content" : "Failure will never overtake me if my determination to succeed is strong enough.",
	"likes" : 1,
	"tags" : [
		"optimist"
	]
},

{
	"author" : "Morbid Mojito",
	"created_at" : ("2017-11-04T00:00:00Z"),
	"content" : "Only I can change my life. No one can do it for me.",
	"tags" : [
		"life"
	]
},

{
	"author" : "Morbid Mojito",
	"created_at" : ("2017-11-07T00:00:00Z"),
	"content" : "Smile in the mirror. Do that every morning and you'll start to see a big difference in your life",
	"likes" : 1,
	"tags" : [
		"life",
		"optimist"
	]
}])

"""for post in collection.find():
	print(post )
print('\n\n')
for results in collection.find({"author":{"$regex":'o$'}}):
	print(results )
print('\n\n')
for results in collection.find({"content":{"$regex":'you'}}):
	print(results)
print('\n\n')
"""