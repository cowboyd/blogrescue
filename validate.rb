require 'rubygems'
require 'json'

rescued = JSON.parse(File.read("output/rescued.categorized.json"))

for doc in rescued
  raise "no category assigned to #{doc['title']}" unless doc["categories"] and doc["categories"].kind_of? Array
end