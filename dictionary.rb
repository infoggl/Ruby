class Dictionary

DICTIONARY_HASH = eval(File.read('data.txt'))	# This gets Ruby to check inside the file for anything it can interperet. It sees that there is a hash stored as a string.

	def save_dictionary
			File.write('data.txt',DICTIONARY_HASH)
			puts "   Saved to disk","" 
	end
	
	def welcome_message
		puts "","   Welcome to the Dictionary."
	end
		
		
	def home_screen
		puts "   Please select from the following choices:",""
		sleep(0.8)
		puts"   Press F and Enter to Find a word.","   Press N and Enter to enter a New definition.","   Press B and Enter to Browse the entire dictionary.","   Press E and Enter to Exit the program.","   Press R and Enter to Resave data.",""
		menu_item = gets.chomp.upcase
		if menu_item == "F"		
			D.find
		elsif menu_item == "N"			
			D.new_entry
		elsif menu_item == "B"
			D.browse
		elsif menu_item == "E"
			puts "","   Exiting"
		elsif menu_item == "R"
			D.save_dictionary			
			D.home_screen
		else 
			puts "","   Hmm... not sure what you mean... what is this #{menu_item} you speak of?","   Let's start over."
			D.home_screen
		end
	end
	
	def find
		puts "","   This is the Find function.","   Please type in an acronym or word and press Enter.",""
		find_term = gets.chomp.upcase
		
		if DICTIONARY_HASH[find_term] != nil
			puts "","   Results for #{find_term}: #{DICTIONARY_HASH[find_term]}",""
			D.home_screen
		else
			puts "","   #{find_term} is not in the dictionary. Let's start over.",""
			D.home_screen
		end
	end	
	
	def new_entry
		puts "","   Please type a word and press Enter.",""
		new_word = gets.chomp.upcase
		puts "","   Thanks. You typed: #{new_word}"
		
		puts "   Please type your definition of #{new_word}:",""
		new_definition = gets.chomp.capitalize
		puts "","   Thanks. You typed: #{new_definition}"
		
		
		DICTIONARY_HASH[new_word] = new_definition
		D.finalize		
		return new_word
	end
	
	def browse
		puts "","   This is the contents of the dictionary:",""
		puts DICTIONARY_HASH
	end

	def finalize
		puts "   To enter more, press Y then press Enter. Otherwise just press Enter.",""
		user_choice = gets.chomp.upcase
		if user_choice == "Y"
			D.new_entry
		else
			D.home_screen
		end
		
	end
	
	
	D = Dictionary.new
	D.welcome_message
	D.home_screen	
	D.save_dictionary
	#sleep(2)
end
