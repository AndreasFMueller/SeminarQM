/*
 * sterngerlach.pov -- 3D Darstellung des Stern-Gerlach Experimentes
 *
 * (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#include "textures.inc"
#include "colors.inc"
#include "textures.inc"
#include "metals.inc"

camera {
        location <1.7, 0.2,-1.5>
        look_at <-0.01, 0, -0.01>
        right 16/9 * x * 0.29
        up y * 0.29
}

global_settings { ambient_light rgb<1,1,1> }

light_source {
        <5, 8, -7> color White
        area_light <0, 2,-1.4>, <-1.4, 2, 0>, 10, 10
}
light_source { <-5, 0.5,-3> color White }
light_source { <5, 0.5,3> color White }

/*
sky_sphere {
        pigment {
                color Gray95
        }
}
*/

object {
	union {
		prism {
			linear_spline
			-0.25 0.25 8
			<-0.1,0> <0.1,0> <0.1,0.1>
			<0.025,0.2> <0,0.2> <-0.025,0.2>
			<-0.1,0.1> <-0.1,0>
		}
		cylinder {
			<0,-0.25,0.2> <0,0.25,0.2> 0.025
		}

		prism {
			linear_spline
			-0.25 0.25 6
			<-0.1,0.3> <0,0.2> <0.1,0.3> <0.1,0.4> <-0.1,0.4> <-0.1,0.3>
			clipped_by {
				object {
					cylinder {
						<0,-0.3,0.2> <0,0.3,0.2> 0.1
						inverse
					}
				}
			}
		}
	}
	pigment { color Gray }
	finish { diffuse 0.5 reflection 0.05 specular 0.3 }
	rotate <90,0,0>
	translate <0,0.2,0>
}

/*
#declare X = -0.2;
#while (X <= 0.2)

#declare a = -40;
#while (a < 41)
cylinder {
	<0,-0.1,X> <0,0,X> 0.003
	pigment {
		color Yellow
	}
	rotate <0,0,a>
}
#declare a = a + 20;
#end
#declare X = X + 0.05;
#end
*/

/*
 * Ungluecklicherweise rendert povray eine mit einem Medium gefuellte
 * Vereinigung nicht richtig, so dass etwas Nacharbeit mit Gimp unvermeidlich
 * ist.
 */
#declare strahlradius = 0.005;

object {
	union {
		cylinder {
			<0,-0.05,-0.5> <0,-0.05,-0.25> strahlradius
			no_shadow
			pigment { rgbt 1 } hollow
			interior {
				media {
					emission <0,30,80>
					method 3
					samples 1 10
					//density { spherical }
				}
			}
		}

#declare r = 10;
#while (r > -20 )
		torus {
			abs(r), strahlradius
			rotate <0,0,90>
			translate <0,r-0.05,-0.25>
			clipped_by {
				box {
					<-0.25,-0.25,-0.25>
					< 0.25, 0.25, 0.25>
				}
			}
			no_shadow
			pigment { rgbt 1 } hollow
			interior {
				media {
					emission <0,30,80>
					method 3
					samples 1 10
					//density { spherical }
				}
			}
		}
		cylinder {
			<0,-0.05,0.249> <0,-0.05,1.77> strahlradius
			translate <0,-r,-0.25>
			rotate <-45 * atan(0.5 / r) / atan(1),0,0>
			translate <0, r,-0.25>
			no_shadow
			pigment { rgbt 1 } hollow
			interior {
				media {
					emission <0,30,80>
					method 3
					samples 1 10
					//density { spherical }
				}
			}
		}
#declare r = r - 20;
#end
	}
//	pigment { color SkyBlue }
//	finish {
//		ambient 0.6
//		specular 1
//	}
/*
	pigment { rgbt 1 } hollow
	interior {
		media {
			emission <0,0,100>
			density { spherical }
		}
	}
*/
}

/*
box {
	<-0.1,-0.15,0.75> <0.1,0.05,0.752>
	pigment {
		color Gray95
	}
}
*/

cylinder {
	<0,-0.05,-0.6> <0,-0.05,-0.5> 0.05
	pigment { color Copper }
}
