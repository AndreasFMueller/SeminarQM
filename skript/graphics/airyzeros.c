/*
 * airyzeros.c -- compute zeros of airy function and derivative
 *
 * (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#include <stdlib.h>
#include <stdio.h>
#include <gsl/gsl_sf_airy.h>
#include <gsl/gsl_errno.h>
#include <gsl/gsl_odeiv2.h>

double	sqr(double x) {
	return x * x;
}

int	f(double t, const double y[], double dydt[], void *params) {
	double	a = gsl_sf_airy_Ai(t, GSL_PREC_DOUBLE);
	dydt[0] = a * a;
	return GSL_SUCCESS;
}

double	norm(double xn) {
	double	result = -1;
	gsl_odeiv2_system	sys = {f, NULL, 1, NULL};
	gsl_odeiv2_driver *d = gsl_odeiv2_driver_alloc_y_new(&sys,
				gsl_odeiv2_step_rk8pd, 1e-6, 1e-6, 0.0);
	double	t = xn;
	double	y[1] = { 0.0 };
	int	status = gsl_odeiv2_driver_apply(d, &t, 100, y);
	if (status != GSL_SUCCESS) {
		fprintf(stderr, "error, rc = %d\n", status);
		goto cleanup;
	}
	result = y[0];
	gsl_odeiv2_driver_free(d);
cleanup:
	return sqrt(result);
}

int	main(int argc, char *argv[]) {
	unsigned int	i;
	for (i = 1; i < 10; i++) {
		double	xn = gsl_sf_airy_zero_Ai_deriv(i);
		printf("%f, %f\n", xn, norm(xn));
		xn = gsl_sf_airy_zero_Ai(i);
		printf("%f, %f\n", xn, norm(xn));
	}
	exit(EXIT_SUCCESS);
}
