require 'rubygems'
require 'nokogiri'
require 'thor'
require 'json'

shell = Thor::Shell::Color.new

revisions = Nokogiri::XML::Document.parse(File.read("node_revisions.xml"))

rescued = []

for revision in revisions.css('node_revisions')
  title = revision.css('title').text
  if shell.yes? "rescue '#{title}'?"
    rescued.push({
      :title => title,
      :body => revision.css('body').text,
      :teaser => revision.css('teaser').text,
      :time => revision.css('timestamp').text
    })
  end
end
File.open("output/rescued.json", "w+") do |f|
  f.write(JSON.pretty_generate(rescued))
end

