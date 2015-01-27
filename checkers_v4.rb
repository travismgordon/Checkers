@checkers_state = ["02020202",
				  "20202020",
				  "02020202",
				  "00000000",
				  "00000000",
				  "10101010",
				  "01010101",
				  "10101010"]

@white_left = 12
@black_left = 12

# print_row checks the state of the board and produces rows accordingly
def print_row row
	@checkers_state[row].split("").each do |num|
		if num == "0"
			print "  |"
		elsif num == "1"
			print "\u2B24 |"
		elsif num == "2"
			print "\u25EF |"
		end
	end
end

# update_board changes the board representation for the user
def update_board
	system "clear"
	puts ""
	puts "  ___  _  _  ____  ___  __ _  ____  ____  ____ "	
	puts ' / __)/ )( \(  __)/ __)(  / )(  __)(  _ \/ ___)'
	puts '( (__ ) __ ( ) _)( (__  )  (  ) _)  )   /\___ \ '
	puts ' \___)\_)(_/(____)\___)(__\_)(____)(__\_)(____/'
	puts "-----------------------------------------------"
	puts ""
	puts "            1  2  3  4  5  6  7  8"
	puts "          |-------------------------|"
	print "        A ||"
	print_row 0
	puts "|"
	puts "          |-------------------------|"
	print "        B ||"
	print_row 1
	puts "|"
	puts "          |-------------------------|"
	print "        C ||"
	print_row 2
	puts "|"
	puts "          |-------------------------|"
	print "        D ||"
	print_row 3
	puts "|"
	puts "          |-------------------------|"
	print "        E ||"
	print_row 4
	puts "|"
	puts "          |-------------------------|"
	print "        F ||"
	print_row 5
	puts "|"
	puts "          |-------------------------|"
	print "        G ||"
	print_row 6
	puts "|"
	puts "          |-------------------------|"
	print "        H ||"
	print_row 7
	puts "|"
	puts "          |-------------------------|\n\n "
end

# update_state takes the piece movement requested and 
# changes the state of the board
def update_state player, row, column, to_row, to_column
	@checkers_state[row][column] = "0"
	@checkers_state[to_row][to_column] = player.to_s
end

# introduce prints out a welcome and how to message
def introduce
	puts "\n  Welcome to REPL Checkers!"
	puts " ---------------------------"
	puts "  How to play: The players must first select a peace, then"
	puts "  they can decide where they would like to move that peace."
	puts "  In order to select a peace you must first choose a row (A-H)"
	puts "  then a column (1-8). All moves must be legal checkers moves."
	puts ""
	print "  Hit enter to start: "
	gets.chomp
end

# get_row gets the row information from the tile entry
def get_row tile
	tile[0].codepoints[0] - 65
end

# get_column gets the column information from the tile entry
def get_column tile
	tile[1].to_i - 1
end

# piece_at_tile? checks to see if a player's piece
# is located at a certain tile
def piece_at_tile? player, tile
	row = tile[0].codepoints[0] - 65
	column = tile[1].to_i - 1
    @checkers_state[row][column].to_i == player
end

# syntax_ok? checks to see if the user entered a tile properly
def syntax_ok? tile
	row = tile[0]
	column = tile[1]
	return ("A".."H").include?(row) && ("1".."8").include?(column)
end

# is_simple? checks to see if the movement requested is simple
def is_simple? player, row, column, to_row, to_column
	return true if ((player == 1) && ((to_column == column + 1) || (to_column == column - 1)) && 
			(to_row == row - 1) && (@checkers_state[to_row][to_column] == "0"))
	return true if ((player == 2) && ((to_column == column + 1) || (to_column == column - 1)) && 
			(to_row == row + 1) && (@checkers_state[to_row][to_column] == "0"))
end

# eat_piece removes a piece from the game
def eat_piece player, row, column
	@checkers_state[row][column] = "0"
	@black_left -= 1 if player == 1
	@white_left -= 1 if player == 2
	if @black_left == 0
		abort ("White Wins!")
	elsif @white_left == 0
		abort("Black Wins!")
	end
end

def is_capture? player, row, column, to_row, to_column
	if (player == 1 && (to_row == row - 2))
		if ((to_column == column + 2) && (@checkers_state[row-1][column+1] == "2"))
			eat_piece(player, row-1, column+1)
			return true
		elsif ((to_column == column - 2) && (@checkers_state[row-1][column-1] == "2"))
			eat_piece(player, row-1, column-1)
			return true
		end
	elsif (player == 2 && (to_row == row + 2))
		if ((to_column == column + 2) && (@checkers_state[row+1][column+1] == "1"))
			eat_piece(player, row+1, column+1)
			return true
		elsif ((to_column == column - 2) && (@checkers_state[row+1][column-1] == "1"))
			eat_piece(player, row+1, column-1)
			return true
		end
	end
end

# jump_again? checks if the piece has another jump opportunity
def jump_again? player, row, column
	if ((player == 1) && (row != 0))
		if ((column != 0) && (@checkers_state[row-1][column-1] == "2") && (@checkers_state[row-2][column-2] == "0"))
			return true
		elsif ((column != 7) && (@checkers_state[row-1][column+1] == "2") && (@checkers_state[row-2][column+2] == "0"))
			return true
		end
	elsif ((player == 2) && (row != 7))
		if ((column != 0) && (@checkers_state[row+1][column-1] == "1") && (@checkers_state[row+2][column-2] == "0"))
			return true
		elsif ((column != 7) && (@checkers_state[row+1][column+1] == "1") && (@checkers_state[row+2][column+2] == "0"))
			return true
		end
	end
end

def check_move(player, row, column, tile) 
	to_row = get_row tile
	to_column = get_column tile
	if is_simple?(player, row, column, to_row, to_column)
		update_state(player, row, column, to_row, to_column)
		update_board
		return true
	elsif is_capture?(player, row, column, to_row, to_column)
		update_state(player, row, column, to_row, to_column)
		update_board
		row = to_row
		column = to_column
		while (jump_again? player, row, column)
			puts "  Jump Again!\n "
			print "  Choose a Tile: "
			jump = gets.chomp.upcase
			to_row = get_row jump
			to_column = get_column jump
			if (syntax_ok?(jump) && is_capture?(player, row, column, to_row, to_column))
				update_state(player, row, column, to_row, to_column)
				update_board
				row = to_row
				column = to_column
			else
				puts "\n    *** Illegal tile chosen ***\n "
				print "      Choose a proper tile: "
				jump = gets.chomp.upcase
				puts ""
			end
		end
		return true
	end
end

# pick_movement allows the player to choose where 
# he wants to move
def pick_movement player, row, column
	if player == 1
		print "\n  Player \u2B24  choose where to move (e.g. G2): "
	elsif player == 2
		print "\n  Player \u25EF choose where to move (e.g. B3): "
	end
	tile = gets.chomp.upcase
	abort("\n  Exit Program") if tile == "quit".upcase
	while true do
		if (syntax_ok?(tile) && check_move(player, row, column, tile))
			return
		else
			puts "\n    *** Illegal tile chosen ***\n "
			print "      Choose a proper tile: "
			tile = gets.chomp.upcase
			abort("\n  Exit Program") if tile == "quit".upcase
			puts ""
		end
	end
end

# pick_piece allows the player to choose which piece 
# he wants to move
def pick_piece player
	if player == 1
		print "  Player \u2B24  choose a piece (e.g. G2): "
	elsif player == 2
		print "  Player \u25EF  choose a piece (e.g. B3): "
	end
	tile = gets.chomp.upcase
	abort("\n  Exit Program") if tile == "quit".upcase
	while true do
		if syntax_ok?(tile) && piece_at_tile?(player, tile)
			return tile
		else
			puts "\n    *** Illegal tile chosen ***\n "
			print "      Choose a proper tile: "
			tile = gets.chomp.upcase
			abort("\n  Exit Program") if tile == "quit".upcase
			puts ""
		end
	end
end

# request_player_action continuously requests actions from 
# the players when it is there turn
def request_player_action
	player = 1
	while true do
		piece = pick_piece player
		row = get_row piece
		column = get_column piece
		pick_movement(player, row, column)
		player == 1? player = 2 : player = 1
	end
end 

update_board
introduce
update_board
request_player_action