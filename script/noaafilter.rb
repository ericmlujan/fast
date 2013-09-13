require 'csv'

print "Enter the filename of the NOAA data to parse: "
# Open the specified file into memory in a read-only mode
filename = gets.chomp
datafile = File.open(filename) or die "Could not open the file."
# Create an empty array to store the lines in the file
contents = []
# Read each line into the contents array for processing
datafile.each_line do |line|
  contents.push line
end
# Prompt the user for a new filename
print "Enter the filename for the processed data (.csv will be appended): " 
newfilename = gets.chomp + ".csv"
# Create the new file and open it for writing
newfile = File.open(newfilename, "w")
# Add the standard CSV headers to the file
newfile.puts "date,status,pressure,height,temperature,dewpointdepression,winddirection,windspeed"
# Prompt for the target altitude
print "Enter the target altitude (m): "
target = gets.to_i
print "Enter the tolerance (m): "
tolerance = gets.to_i
@lower_bound = target - tolerance
@upper_bound = target + tolerance
# Let the user know this may take a while
puts "Processing, reformatting, and filtering data file. This may take a while. \nWe'll let you know when we're done."
# Iterate through each line and remove any that have invalid data
contents.each do |line|
  # Handle a regular line of data
  if line[0] == "#"
    @year = line[6..9]
    @month = line[10..11]
    @day = line[12..13]
  end
  unless line.include? "-9999" or line[0] == "#"
    line =  @month + '/' + @day + '/' + @year + ',' + line
    line = line.gsub(/ +/, ',')
    line = line.gsub(/B/, '')
    # Parse the newly created CSV data to extract its altitude
    csvdata = CSV.parse(line)
    csvdata.each do |row|
      @altitude = row[3].to_i
    end
    # Test to see if the altitude falls between the specified range. If so, put it in the file.
    if (@lower_bound..@upper_bound) === @altitude
      newfile.puts line
    end
  end
  # Handle an initialization header
end
# Clear up system resources, since we're just nice like that
newfile.close
datafile.close
# Celebrate, perhaps by opening some champagne?
puts "New file saved!"