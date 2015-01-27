@checkers_state = ["02020202",
				  "20202020",
				  "02020202",
				  "00000000",
				  "00000000",
				  "10101010",
				  "01010101",
				  "10101010"]

# start_board prints out the checker board in it's inital state
def start_board
	puts ""
	puts "      1  2  3  4  5  6  7  8"
	puts "    |-------------------------|"
	puts "  A ||  |\u25EF |  |\u25EF |  |\u25EF |  |\u25EF ||"
	puts "    |-------------------------|"
	puts "  B ||\u25EF |  |\u25EF |  |\u25EF |  |\u25EF |  ||"
	puts "    |-------------------------|"
	puts "  C ||  |\u25EF |  |\u25EF |  |\u25EF |  |\u25EF ||"
	puts "    |-------------------------|"
	puts "  D ||  |  |  |  |  |  |  |  ||"
	puts "    |-------------------------|"
	puts "  E ||  |  |  |  |  |  |  |  ||"
	puts "    |-------------------------|"
	puts "  F ||\u2B24 |  |\u2B24 |  |\u2B24 |  |\u2B24 |  ||"
	puts "    |-------------------------|"
	puts "  G ||  |\u2B24 |  |\u2B24 |  |\u2B24 |  |\u2B24 ||"
	puts "    |-------------------------|"
	puts "  H ||\u2B24 |  |\u2B24 |  |\u2B24 |  |\u2B24 |  ||"
	puts "    |-------------------------|\n "
end

# introduce prints out a welcome and how to message
def introduce
	puts "\n  Welcome to REPL Checkers!"
	puts " ---------------------------"
end

def legal_move?(row, column, to_row, to_column, player)
	possible_moves = []
	if (player == 1)
		possible_moves << [row.to_i-1. column-1] if ((row
	elsif (player == 2)
	end
end

def move_piece(player, row, column)
	if player == 1
		print "Player \u2B24  choose a spot to move your piece (e.g. G2): "
	elsif player == 2
		print "Player \u25EF choose a spot to move your piece (e.g. B3): "
	end
	tile = gets.chomp.upcase

	while (true) do
		to_row = tile[0]
		to_column = tile[1].to_i - 1
		if (("A".."Z").include?(row) && (0..7).include?(column) && legal_move?(row, column, to_row, to_column, player)
			puts "yay"
			return
		else
			puts "\n    *** Illegal tile chosen ***"
			puts "    Choose a proper tile: "
			tile = gets.chomp.upcase
		end
	end
end

# is_piece_there? checks if there is a certain player's piece
# at the selected position
def is_piece_there?(row, column, player)
	row_num =  row.codepoints[0] - 65
	@checkers_state[row_num][column].to_i == player ? true : false
end

# check_for_piece checks to see if the user entered a proper tile
def check_for_piece(tile, player)
	while (true) do
		row = tile[0]
		column = tile[1].to_i - 1
		if (("A".."Z").include?(row) && (0..7).include?(column) && is_piece_there?(row, column, player))
			move_piece(player, row, column)
			return
		else
			puts "\n    *** Illegal tile chosen ***"
			puts "    Choose a proper tile: "
			tile = gets.chomp.upcase
		end
	end
end

# pick_tile allows the user to pick a tile
def pick_tile(player)
	if player == 1
		print "Player \u2B24  choose a piece (e.g. G2): "
	elsif player == 2
		print "Player \u25EF choose a piece (e.g. B3): "
	end
	tile = gets.chomp.upcase
	check_for_piece(tile, player)
end


def request_action 
	player = 1
	pick_tile(player)

	player = 2 if player == 1
	player = 1 if player == 2	
end

start_board
introduce
request_action


