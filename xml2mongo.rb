# bare bones arbitrary XML file to MongoDB
require 'crack'
require 'open-uri'
require 'mongo'
 
# Mongo connection
conn = Mongo::Connection.new("my_mongo_server", 27017)
db   = conn.db('my_db')
col  = db.collection('my_collection')

# Open and parse XML file
data = open("/path/to/file").read
data = Crack::XML.parse(data)
 
# Insert data
col.insert(data)
