# Rock = A = X
# Paper = B = Y
# Scissors = C = Z

SHAPES_POINTS = {
	"X": 1,
	"Y": 2,
	"Z": 3
}

ROUNDS_PLAY = {
	"AX": 3,
	"AY": 6,
	"AZ": 0,
	"BX": 0,
	"BY": 3,
	"BZ": 6,
	"CX": 6,
	"CY": 0,
	"CZ": 3
}


ENDINGS = {
	"X": 0, # X = loose
	"Y": 3, # Y = draw
	"Z": 6  # Z = win
}

score_1, score_2 = 0, 0

File.foreach("input2.txt") { |line|
	next if line == "\n"

	# Part 1
	score_1 += (ROUNDS_PLAY["#{line[0]}#{line[2]}".to_sym] + SHAPES_POINTS[line[2].to_sym].to_i)

	# Part 2
	possible_keys = ROUNDS_PLAY.keys.select { |key| key.to_s.start_with?(line[0]) }

	choosen_shape = possible_keys.select { |key|
		ROUNDS_PLAY[key] == ENDINGS[line[2].to_sym]
 	}.first.to_s[-1]

 	shape_points = SHAPES_POINTS[choosen_shape.to_sym]
	round_points = ENDINGS[line[2].to_sym]
	score_2 += (shape_points + round_points)
}

puts score_1
puts score_2

