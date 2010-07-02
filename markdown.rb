require 'rubygems'
require 'nokogiri'
require 'json'
require 'un'

rescued = JSON.parse(File.read "output/rescued.categorized.json")

for eg in rescued

dir = "output/markdown/pages/#{eg['categories'].first.downcase}"
url_title = eg['title'].downcase.gsub(/[':.]/,'').gsub(/\s+/,"-")
file = File.join(dir,"#{url_title}.mdown")

FileUtils.mkdir_p dir
File.open(file, "w") do |f|
  f.write <<-MDOWN
Date: #{Time.at(eg['time'].to_i)}
Summary: #{eg['teaser']}
Categories: #{eg['categories'].join(', ')}

# #{eg['title']}

#{eg['body']}
MDOWN
end
end