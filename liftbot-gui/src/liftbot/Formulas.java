package liftbot;

/** LiftBot for the Java GUI (written using Swing and WindowBuilder Pro
 * 
 * @author Eric Lujan
 *
 */

public class Formulas {
	
	/* Rounds a double to the specified number of decimal places. */
	public static double round(double value, int places) {
	    if (places < 0) throw new IllegalArgumentException();

	    long factor = (long) Math.pow(10, places);
	    value = value * factor;
	    long tmp = Math.round(value);
	    return (double) tmp / factor;
	}
	/* Use the ideal gas law to solve for a gas's density under given conditions. */
	public static double density(double launchPressure, double rGas, double launchTemperature){
		double density = launchPressure / (rGas*launchTemperature);
		return density;
	}
	/* Use the ideal gas law that we derived in the lab to solve for the volume of a gas needed to attain lift. */
	public static double volume(double force, double balloonMass, double payloadMass, double molarMass, double gasDensity, double airDensity){
		double balloonVolume = ( -1. * force - balloonMass - payloadMass) / (0.0446429 * molarMass - (airDensity - gasDensity));
		return balloonVolume;
	}
	/* Use the combined gas law to convert a given volume of gas under certain conditions to standard cubic meters. */
	public static double convertToSTP(double volume, double temperature, double pressure){
		double volumeSTP = (volume * pressure * 298) / (101300 * temperature);
		return volumeSTP;
	}
	
	public static double volumeChange(double launchVolume, double targetVolume){
		return targetVolume - launchVolume;
	}
	
}
