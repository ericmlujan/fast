//
//  pressurefunc.h
//  bp
//
//  Created by Eric Lujan on 6/14/13.
//  Copyright (c) 2013 Flying Apple Space Technologies. All rights reserved.
//

#ifndef bp_pressurefunct_h
#define bp_pressurefunct_h

/* Reusable function for backpressure that is extensible and does not require the user to re-run the program from the shell. */
float backpressure(float r, float r0, float d0, float m, float lambda, float k){
	return (2*m*(d0/r0))*(pow(lambda, -1)-pow(lambda, -7))*(1+k*pow(lambda, 2)); /* The backpressure formula from Jake's post on team.flyapple.org */
}

void usage(){
	printf("Usage: \n");
    printf("Start the user-friendly command line interpreter:\n");
	printf("  bp --interpreter\n");
    printf("Run the calculation directly from the command line using values in meters):\n");
	printf("  bp -t [THICKNESS] -u [UNINFLATED RADIUS] -i [INFLATED RADIUS]\n");
    printf("Show information about this program: \n");
	printf("  bp --about\n");
}

void about(){
	printf("The Flying Apple Space Technologies Backpressure Calculator\n");
	printf("Initially written by Jake Lee and refined and documented by Eric Lujan.\n");
	printf("Based on research by Matt from zmatt.net and his awesome Matlab files.\n");
	printf("Written on 13 June 2013 at the University of Nevada, Las Vegas.\n");
	printf("This program is released under the terms of the MIT License.\n");
}

#endif
