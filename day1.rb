elves_calories = []
File.foreach("input1.txt") { |line| elves_calories << line.to_i }

elves = []
n = 0
elves_calories.each do |calories|
	if calories.zero?
		n = n + 1
	else
		elves[n] = elves[n].nil? ? calories : elves[n] += calories
	end
end

p elves.max
p elves.max(3).sum

