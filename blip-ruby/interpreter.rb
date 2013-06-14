def interpreter 
	puts "Welcome to the Balloon Landing Inference Program!"
	puts "Version 0.0.1 (Ruby 1.9.3)"
	puts "For help, type 'usage' or 'help'. To exit, type 'exit'."
	puts "Interactive interpreter ready."

	input = ""

	while nil == nil
		print "blip> "
		input = gets.downcase.strip
		if input == "help"
			help
		elsif input == "usage"
			usage
		elsif input == "predict"
			puts "Run the predictor!"
		elsif input == "about"
			about
		elsif input == "exit"
			puts "Bye."
			return nil
		elsif input == ""
		else
			puts "Unknown command or syntax error. For help, type 'usage' or 'help'."
		end
	end
end