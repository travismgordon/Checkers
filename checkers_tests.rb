# @checkers_state = ["02020202",
# 				  "20202020",
# 				  "02020202",
# 				  "00000000",
# 				  "00020000",
# 				  "10101010",
# 				  "01010101",
# 				  "10101010"]


# def move_legal? player, row, column, tile
# 	to_row = get_row tile
# 	to_column = get_column tile
# 	if player == 1
# 		return true if (((to_column == column + 1) || (to_column == column - 1)) && 
# 			(to_row == row - 1) && (@checkers_state[to_row][to_column] == "0"))
# 	elsif player == 2
# 		return true if (((to_column == column + 1) || (to_column == column - 1)) && 
# 			(to_row == row + 1) && (@checkers_state[to_row][to_column] == "0"))
# 	end
# 	if (player == 1 && (to_row == row - 2))
# 		return true if ((to_column == column + 2) && (@checkers_state[row-1][column+1] == "2"))
# 		return true if ((to_column == column - 2) && (@checkers_state[row-1][column-1] == "2"))
# 	elsif (player == 2 && (to_row == row + 2))
# 		return true if ((to_column == column + 2) && (@checkers_state[row+1][column+1] == "1"))
# 		return true if ((to_column == column - 2) && (@checkers_state[row+1][column-1] == "1"))
# 	end

# end

# # get_row gets the row information from the tile entry
# def get_row tile
# 	tile[0].codepoints[0] - 65
# end

# # get_column gets the column information from the tile entry
# def get_column tile
# 	tile[1].to_i - 1
# end

# puts move_legal?(1, 5, 2, "D5")

def method
	abort("Message")
	puts "Sfsd"
end

method
puts "hey"


# def legal_move?(row, column, to_row, to_column, player)
# 	possible_moves = []
# 	possible_moves << [row.codepoints[0] - 66 , column+1] if ((row.codepoints[0] - 66 > 0) && (column+1 <= 8) && (@checkers_state[row.to_i-2][column+1].to_i == 0))
# 	puts row.codepoints[0] - 66
# 	puts column + 1
# 	puts @checkers_state[row.to_i-2][column+1].to_i
# 	p possible_moves
# 	puts to_row.codepoints[0] - 65
# 	if possible_moves.include?([to_row.codepoints[0] - 67, to_column])
# 		return true
# 	else
# 		return false
# 	end
# end

# #puts legal_move?("F", 1, "G", 0, 1)
# puts legal_move?("F", 1, "G", 2, 1)

# def syntax_ok? tile
# 	row = tile[0]
# 	column = tile[1]
# 	return ("A".."H").include?(row) && ("1".."8").include?(column)
# end

# puts syntax_ok? "H9"

# # print_row checks the state of the board and produces rows accordingly
# def print_row row
# 	@checkers_state[row].split("").each do |num|
# 		if num == "0"
# 			print "  |"
# 		elsif num == "1"
# 			print "\u2B24 |"
# 		elsif num == "2"
# 			print "\u25EF |"
# 		end
# 	end
# end


# # update_board changes the board representation for the user
# def update_board
# 	system "clear"
# 	puts ""
# 	puts "      1  2  3  4  5  6  7  8"
# 	puts "    |-------------------------|"
# 	print "  A ||"
# 	print_row 0
# 	puts "|"
# 	puts "    |-------------------------|"
# 	print "  B ||"
# 	print_row 1
# 	puts "|"
# 	puts "    |-------------------------|"
# 	print "  C ||"
# 	print_row 2
# 	puts "|"
# 	puts "    |-------------------------|"
# 	print "  D ||"
# 	print_row 3
# 	puts "|"
# 	puts "    |-------------------------|"
# 	print "  E ||"
# 	print_row 4
# 	puts "|"
# 	puts "    |-------------------------|"
# 	print "  F ||"
# 	print_row 5
# 	puts "|"
# 	puts "    |-------------------------|"
# 	print "  G ||"
# 	print_row 6
# 	puts "|"
# 	puts "    |-------------------------|"
# 	print "  H ||"
# 	print_row 7
# 	puts "|"
# 	puts "    |-------------------------|\n\n "
# end
















