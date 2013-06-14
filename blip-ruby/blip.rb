# The Balloon Landing Inference Program
# Version 0.0.1 (indev)
# Ruby 1.9.3
# This version created on 28 April 2013 by Eric Lujan at the University of Nevada, Las Vegas.
# This program is released under the MIT License.

# Import required files

require './interpreter.rb'
require './docs.rb'

# Create an 'args' array for command line arguments and store the first one in it.

args = []
args[0] = ARGV[0]


if args.to_s == "[nil]" || args.to_s == ''
	# Call the interpreter function from 'interpreter.rb' if no arguments are specified.
	interpreter
else
	args.each do |a|
		if a == "help"
			# Call the help function from 'docs.rb' if the user wants help.
			help
		elsif a == "predict"
			# This will eventially call a function to predict the landing site.
			puts "I'll call the predictor (eventually)"
		elsif a == "about"
			# Get some credit and bore people with details about my life.
			about
		elsif a == "usage"
			# Call the usage function from 'docs.rb' if the user wants to know commands.
			usage
		else
			# Display error message if the syntax is wrong.
			puts "Unknown syntax or parameter. For help, try 'blip usage' or 'blip help'."	
		end
	end
end

# End of file (sad face)