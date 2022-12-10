n = 1
PRIORITIES = [*'a'..'z', *'A'..'Z'].each_with_object({}) do |letter, memo|
	memo[letter] = n
	n += 1
end


# PART 1
priorities_sum_1 = 0
File.foreach("input3.txt") do |line|
	middle = line.strip.length/2.to_f - 1 # pour splitter la chaine en 2 chaines de même taille
	bag_1 = line[0..middle].split("")
	bag_2 = line[middle+1..-1].split("")
	common_letter = (bag_1 & bag_2).first # trouver la lettre commune entre les 2 chaines
	priorities_sum_1 += PRIORITIES[common_letter] if PRIORITIES.include?(common_letter) # additioner la priorité de chaque lettre
end

p priorities_sum_1

# PART 2
elves = []
File.foreach("input3.txt") {|line| elves << line.strip unless line == "\n" }

elves_groups = elves.each_slice(3)
priorities_sum_2 = 0
elves_groups.each do |group|
	group = group.map { |elf| elf.split("").to_a}
	common_letter = (group[0] & group[1] & group[2]).first
	priorities_sum_2 += PRIORITIES[common_letter]
end

p priorities_sum_2

