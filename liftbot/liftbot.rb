#!/usr/bin/env ruby
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

def saveInput(input)
	return input.chomp.to_f
end

puts "Welcome to LiftBot!"
puts "Version 0.0.1. Written for Ruby 1.9.3-head."
puts "Written by Eric Lujan on 13 June 2013 at the University of Nevada, Las Vegas."
puts "\nBased on research by Eric Lujan, Jake Lee, and Ian Rabago."
puts "Special thanks to Amanda Maxham, Ph.D and Edward Giandomenico."
puts "\nPlease provide the following information in the units specified."
puts "Press ^C (Ctrl + C) to exit without calculating."
print "\nMass of the balloon in kilograms: "
balloonMass =  saveInput(gets)
print "Mass of the attached payloads in kilograms: "
payloadMass = saveInput(gets)
rAir = 286.9
print "Gas constant of the lifting gas in J/kgK (4124 for hydrogen): "
rGas = saveInput(gets)
print "Molar mass of the lifting gas in kg/mol (0.00201 for hydrogen): "
molarMass = saveInput(gets)
print "Pressure at the launch point in pascals (101300 for STP): "
launchPressure = saveInput(gets)
print "Temperature at the launch point in Kelvins (298 for STP): "
launchTemperature = saveInput(gets)
print "Desired initial upwards force (in excess of gravity) in kilograms of force: "
launchForce = saveInput(gets)
print "Balloon membrane pressure (backpressure) at the launch point in pascals (type 0 if you don't know): "
launchMembranePressure = saveInput(gets)
print "Pressure of the atmosphere at the desired altitude in pascals (1197 for 30,000 meters): "
altPressure = saveInput(gets)
print "Temperature of the atmosphere at the desired altitude in Kelvins (226.51 for 30,000 meters): "
altTemperature = saveInput(gets)
print "Desired net upwards force at the desired altitude in kilograms of force (0 for neutral buoyancy): "
altForce = saveInput(gets)
print "Balloon membrane pressure (backpressure) at the desired altitude in pascals (type 0 if you don't know): "
altMembranePressure = saveInput(gets)

launchAirDensity = density(launchPressure, rAir, launchTemperature)

launchGasDensity = density(launchPressure, rGas, launchTemperature)

launchVolume = volume(launchForce, balloonMass, payloadMass, molarMass, launchGasDensity, launchAirDensity)

altAirDensity = density(altPressure, rAir, altTemperature)

altGasDensity = density(altPressure, rGas, altTemperature)

altVolume = volume(altForce, balloonMass, payloadMass, molarMass, altGasDensity, altAirDensity)

stpVolume = convertToSTP(altVolume, altPressure, altTemperature)

flightChange = volumeChange(launchVolume, stpVolume)

puts "\nCalculation results:"
puts "Amount to fill the ballon with at launch: " + launchVolume.to_s + " standard cubic meters"
puts "Volume of lift gas in the balloon at altitude to attain specified target lift force at altitude: " + altVolume.to_s + " cubic meters"
puts "Volume of lift gas to attain specified target lift at altitude, converted to STP to make analysis easier: " + stpVolume.to_s + " standard cubic meters"
puts "Difference between volume to attain specified target lift at altitude and amount you filled the balloon with: " + flightChange.to_s + " standard cubic meters"
