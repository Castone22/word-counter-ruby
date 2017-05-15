require 'json'

## Tool written to do word count on an input file.
## - Some considerations
##   Words can be composites, including - or '
##   Capitalization should be ignored.
##   Output can be placed in a file type of choice
##   -- In this regard I chose to go with json since some of that yaml reserved keys were making output look weird.

file_to_count = File.open('./countme.txt')
contents = file_to_count.read
contents.downcase!

pattern = /[^a-zA-Z0-9\-']/
contents.gsub!(pattern , ' ')

words = contents.split
results = {}

words.each do |word|
  if results.has_key?(word)
    results[word] += 1
  else
    results[word] = 1
  end
end

results = results.sort_by {|_key, value| value}.reverse

File.write('out.json', JSON.pretty_generate(results.to_h))






