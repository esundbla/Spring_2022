from pymongo import MongoClient



connectionString="mongodb+srv://sinbad:SunWood4117@cluster0.tz6ko.mongodb.net/blog?retryWrites=true&w=majority"
cluster = MongoClient(connectionString)
db = cluster["employees"]
collection = db["employees"]

"""
collection.insert_many([{
        'name': 'John',
        'department': 'sales',
        'projects': ['bluffee', 'jomoorjs', 'auton' ]
    },

    {
        'name': 'Mary',
        'department': 'sales',
        'projects': ['codete', 'auton' ]
    },

    {
        'name': 'Peter',
        'department': 'hr',
        'projects': ['auton', 'zoomblr', 'instory', 'bluffee' ]
    },

    {
        'name': 'Janet',
        'department': 'marketing',
    },

    {
        'name': 'Sunny',
        'department': 'marketing',
    },

    {
        'name': 'Winter',
        'department': 'marketing',
        'projects': [ 'bluffee', 'auton' ]
    },

    {
        'name': 'Fall',
        'department': 'marketing',
        'projects': [ 'bluffee', 'scrosnes' ]
    },

    {
        'name': 'Summer',
        'department': 'marketing',
    },

    {
        'name': 'Sam',
        'department': 'marketing',
        'projects': ['scrosnes' ]
    },

    {
        'name': 'Maria',
        'department': 'finances',
        'projects': ['conix', 'filemenup', 'scrosnes', 'specima', 'bluffee' ]
    }]) """

query_1 = [{
    "$group" :
        {"_id" : "$department",
         "employees" :
             {"$sum" : 1}
         }}
    ]

query_2 = [
    {"$group" :
        {"_id" : "$department",
         "employees" :
             {"$sum" : 1}
         }
    },
    {"$sort" :
        {"_id" : 1}

    }
]

query_3 = [
    {"$unwind" : "$projects"},
    {"$group" :
         {"_id" : "$projects"}},
    {"$sort": {"_id": 1}}
]

query_4 = [
    {}
]

for results in collection.aggregate(query_1):
    print(results)
print('*'*20)
for results in collection.aggregate(query_2):
    print(results)
print('*'*20)
for results in collection.aggregate(query_3):
    print(results)
print('*'*20)

