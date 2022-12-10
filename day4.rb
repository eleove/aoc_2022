elves_pairs = []
File.foreach("input4.txt") {|line| elves_pairs << line.strip unless line == "\n" }

# PART 1
def self_contained?(elf_1, elf_2)
	(elf_2.first >= elf_1.first && elf_2.last <= elf_1.last) ||
	(elf_1.first >= elf_2.first && elf_1.last <= elf_2.last)
end

sum = 0
elves_pairs.each do |pair|
	pair = pair.split(",").map {|range| range.split("-") }
	elf_1 = pair.first.map(&:to_i)
	elf_2 = pair.last.map(&:to_i)
	sum += 1 if self_contained?(elf_1, elf_2)
end

p sum

# PART 2
sum = 0
elves_pairs.each do |pair|
	pair = pair.split(",").map {|range| range.split("-") }.flatten.map(&:to_i)
	elf_1_range = (pair[0]..pair[1]).to_a
	elf_2_range = (pair[2]..pair[3]).to_a
	sum +=1 unless (elf_1_range & elf_2_range).empty?
	# p elf_1_range & elf_2_range
end

puts sum
