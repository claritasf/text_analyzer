stop_words = %w{the a an as by on for of are is with just but and to my I has some in on or}

lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

#count characters
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length

#count words, sentences and paragraphs
words = text.split
word_count = words.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

#list of words that aren't stop words 
key_words = words.select {|word| !stop_words.include?(word)}
percentage_useful_words = ((key_words.length.to_f / word_count.to_f) * 100).to_i

#summarize the text by picking some choice sentences

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by {|sentence| sentence.length}
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third +1)
ideal_sentences = ideal_sentences.select {|sentence| sentence =~ /is|are/}

#return the analysis to the user
puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters excluding spaces"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragrahps"
puts "#{sentence_count / paragraph_count} sentences per paragrahps (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{percentage_useful_words}% of useful words per text (percentage)"
puts "Summary: \n\n" + ideal_sentences.join(". ") 
puts "---- End of analysis ----"






#this is another way of getting the lines count, first open the file and pass the lines into a block
#line_count = 0
#text = ""
#File.open("text.txt").each do  |line| 
#  line_count += 1 
#  text << line
#end