#
# Makefile -- build images for exercises
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	exercise

exercise_FILES = exercise-1.pdf
exercise: $(exercise_FILES)

$(exercise_FILES):	exercise.mp
	TEX=latex mpost exercise.mp
	for i in 1; \
	do \
		mptopdf exercise.$${i}; \
	done

