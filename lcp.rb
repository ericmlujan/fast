require 'geocoder'
require 'forecast_io'

# Define mission parameters here. Working on making a launchfile API soon. Until then, harcoded.

launch_time = Time.local(2013,7,24,9,00)
mission_name = "FAST-11"
launch_location = "Nipton, CA"
launch_coords = Geocoder.coordinates(launch_location)
latitude = launch_coords[0]
longitude = launch_coords[1]
hydrogen = true
rAir = 286.9
balloon_mass = 1.6
payload_mass = 1.5
launch_force = 2.786

def mbar_to_pascal (pressure)
  pascal = pressure * 100
end

def celsius_to_kelvin(celsius)
  kelvin = celsius + 273
end

def density(p, r, t)
	density = p / (r*t)
	return density
end

def volume(force, balloonMass, payloadMass, molarMass, gasDensity, airDensity)
	volume = ( -force - balloonMass - payloadMass) / (0.0446429 * molarMass - (airDensity - gasDensity))
	return volume
end

def convertToSTP(volume, pressure, temperature)
	volumeSTP = (volume * pressure * 298) / (101300 * temperature)
	return volumeSTP
end

def volumeChange(launchVolume, targetVolume)
	return targetVolume - launchVolume
end

ForecastIO.configure do |configuration|
  configuration.api_key = '8826650e770499ac02d3d72d17afd3c8'
end



system("clear")
puts "F L Y I N G  A P P L E  S P A C E  T E C H N O L O G I E S"
puts "LAUNCH INFORMATION INTERFACE"

if hydrogen
  rgas = 4124
  molar_mass = 0.00201
  gas = "Hydrogen"
else
  rgas = 2077
  molar_mass = 0.00400
  gas = "Helium"
end

puts "\n############## DISPLAY MISSION PARAMETERS ##############"
puts "MISSION IDENTIFIER: " + mission_name
puts "LAUNCH LOCATION: " + launch_location.upcase
puts "LAUNCH COORDINATES: " + launch_coords[0].to_s + ", " + launch_coords[1].to_s
puts "LAUNCH TIME: " + launch_time.to_s.upcase  + " PACIFIC TIME"
puts "LIFTING GAS: " + gas.upcase
puts "PAYLOAD MASS: " + payload_mass.to_s + " KG"
puts "BALLOON MASS: " + balloon_mass.to_s + " KG"
puts "FREE LIFT: " + ( launch_force - ( payload_mass + balloon_mass ) ).to_s + " KG"
puts "#########################################################"

puts ""

print "OBTAINING ATMOSPHERIC DATA FROM NOAA DATABASE....\r"
launch_forecast = ForecastIO.forecast(latitude,longitude, time: launch_time.to_i, params:{ units: 'si'}).currently
current_forecast = ForecastIO.forecast(latitude,longitude, params:{ units: 'si'}).currently
STDOUT.flush
print "DATA DOWNLOAD COMPLETE.                                  "
sleep(2)


puts "\n\n"

puts "========================================================"
puts "WEATHER INFORMATION FOR " + launch_location.upcase
puts "CURRENT CONDITIONS AT LAUNCH POINT:"

puts "OVERALL: " + current_forecast.summary.upcase
puts "TEMPERATURE: " + current_forecast.temperature.to_s + " CELSIUS"
puts "CLOUD COVER: " + current_forecast.cloudCover.to_s
puts "DEW POINT: " + current_forecast.dewPoint.to_s + " CELSIUS"
puts "HUMIDITY: " + current_forecast.humidity.to_s
puts "BAROMETRIC PRESSURE: " + current_forecast.pressure.to_s + " MMHG"
puts "WIND: " + current_forecast.windSpeed.to_s + " KPH AT A HEADING OF " + current_forecast.windBearing.to_s + " DEGREES"

puts ""
puts "PROJECTED CONDITIONS AT LAUNCH POINT: "
puts "OVERALL: " + launch_forecast.summary.upcase
puts "TEMPERATURE: " + launch_forecast.temperature.to_s + " CELSIUS"
puts "CLOUD COVER: " + launch_forecast.cloudCover.to_s
puts "DEW POINT: " + launch_forecast.dewPoint.to_s + " CELSIUS"
puts "HUMIDITY: " + launch_forecast.humidity.to_s
puts "BAROMETRIC PRESSURE: " + launch_forecast.pressure.to_s + " MBAR"
puts "WIND: " + launch_forecast.windSpeed.to_s + " KPH AT A HEADING OF " + launch_forecast.windBearing.to_s + " DEGREES"
puts "========================================================"

puts ""

air_density = density(mbar_to_pascal(launch_forecast.pressure), rAir, celsius_to_kelvin(launch_forecast.temperature))
gas_density = density(mbar_to_pascal(launch_forecast.pressure), rgas, celsius_to_kelvin(launch_forecast.temperature))
fill_volume = volume(launch_force, balloon_mass, payload_mass, molar_mass, gas_density, air_density)

puts "========================================================"
puts "BALLOON LIFT COMPUTATIONS"
puts "AIR DENSITY AT LAUNCH POINT: " + air_density.to_s + " KG/M^3"
puts "LIFTING GAS DENSITY AT LAUNCH POINT: " + gas_density.to_s + " KG/M^3"
puts "IDEAL BALLOON FILL VOLUME: " + convertToSTP(fill_volume, mbar_to_pascal(launch_forecast.pressure), celsius_to_kelvin(launch_forecast.temperature)).to_s + " STD M^3 (" + (convertToSTP(fill_volume, mbar_to_pascal(launch_forecast.pressure), celsius_to_kelvin(launch_forecast.temperature)) * 35.3147).to_s + " STD FT^3)"
puts "========================================================"


