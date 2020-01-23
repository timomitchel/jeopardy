require 'json'

file = open("jeopardy.json")
json = file.read

parsed = JSON.parse(json)
counted_categories = parsed.group_by{|h| h["category"]}.map{|k,v| [k, v.size]}.to_h
sorted_categories = counted_categories.sort_by {|k,v| v}.reverse
counted_answers = parsed.group_by{|h| h["answer"]}.map{|k,v| [k, v.size]}.to_h
sorted_answers = counted_answers.sort_by {|k,v| v}.reverse
