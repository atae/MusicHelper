#Take in inputs from user
#How many genres?
#BPM? (enter rand for random)

total_genres = 1
bpm = 40
valid = false
valid2 = false
genre_output = []


#open file
file = File.open("../data/Music Genres.csv", "r")
genres = file.read.split(',,,,,,,,,,,,,,,')


#ask for input and check
until valid == true
	puts "How many genres? (Between 1 and #{genres.length}.)"
	total_genres = gets.chomp

	if total_genres.to_i <= 0 || total_genres.to_i > 376
		puts "That's not a proper value. Try again."
	else
		valid = true
	end

end

#give random BPM or take user BPM
until valid2 == true
	puts "Max BPM? (Enter 'rand' for random)"
	max_bpm = gets.chomp

	if max_bpm != 'rand' && max_bpm.to_i <= 0
		puts "That's not a proper value. Try again."
	else
	valid2 = true
	end

end

if max_bpm == 'rand'
	bpm = rand(40..320)
else
	bpm = rand(1..max_bpm.to_i)
end

#TODO: create check for instrumentation


#pull out random genres
idx = 0
until idx == total_genres.to_i
	genre_index = rand(0..genres.length)
	genre_output << genres[genre_index].strip

	genre_output.uniq!

	idx = genre_output.length
end

puts "Your combined genres are: "
puts genre_output.join(' + ')
puts "Your BPM is: #{bpm}."






