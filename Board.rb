class Board

	attr_accessor :state

	def initialize
		@state = ["02020202",
				  "20202020",
				  "02020202",
			   	  "00000000",
				  "00000000",
			      "10101010",
			      "01010101",
			      "10101010"]
	end

	def start
		print_title
		print_board
		introduce
	end

	def print_title
		system "clear"
		puts ""
		puts "  ___  _  _  ____  ___  __ _  ____  ____  ____ "	
		puts ' / __)/ )( \(  __)/ __)(  / )(  __)(  _ \/ ___)'
		puts '( (__ ) __ ( ) _)( (__  )  (  ) _)  )   /\___ \ '
		puts ' \___)\_)(_/(____)\___)(__\_)(____)(__\_)(____/'
		puts "-----------------------------------------------"
	end

	def print_row row
		@state[row].split("").each do |num|
			if num == "0"
				print "  |"
			elsif num == "1"
				print "\u2B24 |"
			elsif num == "2"
				print "\u25EF |"
			end
		end
	end

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

	# rewrite this code to refactor the print loop
	def print_board
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
end

b = Board.new
b.start