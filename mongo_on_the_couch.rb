# encoding: utf-8
require 'mongo'
require 'couchrest'

default_couchdb_port = 5984
default_mongodb_port = 27017

begin
	@mongodb = Mongo::Connection.new("localhost", default_mongodb_port).db("nosql_zaliczenie")
	@collection = @mongodb.collection("mnostwo_bashow")
rescue
	puts "Czy mongod napewno śmiga na porcie #{default_mongodb_port}?"
	exit 
end

@couchdb = CouchRest.database!("http://localhost:#{default_couchdb_port}/nosql_zaliczenie")
@couchdb.recreate!

jsons = []
offset = 1
batch_size = 1000
collection_size = @collection.count
while offset * batch_size - batch_size < collection_size do
  jsons = @collection.find(nil,{:limit => batch_size, :skip => (offset * batch_size - batch_size)}).to_a
  @couchdb.bulk_save(jsons)
  offset += 1
end
