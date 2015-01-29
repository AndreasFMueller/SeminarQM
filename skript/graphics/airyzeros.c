/*
 * airyzeros.c -- compute zeros of airy function and derivative
 *
 * (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#include <stdlib.h>
#include <stdio.h>
#include <gsl/gsl_sf_airy.h>

int	main(int argc, char *argv[]) {
	unsigned int	i;
	for (i = 1; i < 10; i++) {
		printf("%f\n", gsl_sf_airy_zero_Ai_deriv(i));
		printf("%f\n", gsl_sf_airy_zero_Ai(i));
	}
	exit(EXIT_SUCCESS);
}
