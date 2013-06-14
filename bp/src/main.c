/*  The Flying Apple Space Technologies Backpressure Calculator
** Initially written in ANSI C by Jake Lee and refined and documented by Eric Lujan.
** Based on research by Matt from zmatt.net and his awesome Matlab files.
** Written on 13 June 2013 at the University of Nevada, Las Vegas.
** This program is released under the terms of the MIT License.
** Successfully compiled by the GNU Compiler Collection (gcc) 4.2.1.
*/


#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "pressurefunct.h"

int main(int argc, char *argv[]){
	float r, r0, d0, lambda, m, p, k; /* Define numerical values for user input */
	int run = 1, i; /* Define integer value for loop */
	char response; /* Define the character for the user's response for the repeat prompt */
    
	if (argc == 7){
		for (i = 1; i < argc; i++){
			if (strcmp(argv[i], "-t") == 0){
				d0 = atof(argv[i + 1]);
			}
			else if (strcmp(argv[i], "-u") == 0){
				r0 = atof(argv[i + 1]);
			}
			else if(strcmp(argv[i], "-i") == 0){
				r = atof(argv[i + 1]);
			}
			else if(argv[i][0] == '-'){
				printf("Error: Unknown command line argument %s.\n", argv[i]);
                usage();
                exit(EXIT_FAILURE);
			}
		}
		if (d0 != 0 && r0 != 0 && r != 0){
			printf("Using %f meters for balloon thickness.\n", d0);
			printf("Using %f meters for uninflated balloon radius.\n", r0);
			printf("Using %f meters for inflated balloon radius.\n", r);
            m = 300000; /* Define the value in pascals */
			k = 0.1; /* Set k=0 for the neo-Hookeian model */
			lambda = r/r0; /* Calculate the lambda ratio */
			p = backpressure(r, r0, d0, m, lambda, k); /* Call the backpressure function and store the pressure as p */
			printf("Total effective backpressure: %f pascals\n",p); /* Print the calculated backpressure to the standard output */

		}
        else{
            printf("Error: All numerical values must be nonzero.\n");
            usage();
        }
	}
	else if (argc == 2 && strcmp(argv[1], "--interpreter") == 0) {
		about();
		printf(" \n");
		
		while (run == 1){
            
			printf("Inflated balloon radius (m): ");
	  		scanf("%f",&r); /* Store the inflated balloon radius as r */
	  		printf("Unstretched balloon radius (m): ");
	  		scanf("%f",&r0); /* Store the unstretched balloon radius as r0 */
	  		printf("Unstretched balloon thickness (m): ");
	  		scanf("%f",&d0); /* Store the thickness of the balloon as d0 */
			m = 300000; /* Define the value in pascals */
			k = 0.1; /* Set k=0 for the neo-Hookeian model */
			lambda = r/r0; /* Calculate the lambda ratio */
			p = backpressure(r, r0, d0, m, lambda, k); /* Call the backpressure function and store the pressure as p */
			printf("Total effective backpressure: %f pascals",p); /* Print the calculated backpressure to the standard output */
			printf("\nWould you like to compute another backpressure with new values (Y/N)? "); /* Prompt the user to repeat the loop */
			getchar(); /* Strip the newline character from the user's input */
			response = getchar(); /* Store this value in the response variable */
            
			if(toupper(response) == 'N'){
				run = 0; /* If the user answered 'no' break the loop */
			}
            
		}
	}
    
    else if (argc == 2 && strcmp(argv[1], "--about") == 0){
        about();
    }
    
	else if (argc == 1){
		usage();
	}
    
	else{
		printf("Invalid command line usage. You must use one of the following usages. \n");
		usage();
	}
    
	return 0; /* Return the success signal for ANSI C */
}

