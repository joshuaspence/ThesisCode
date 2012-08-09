#ifndef DISTANCE_SQUARED_H_
#define DISTANCE_SQUARED_H_

#include <stdlib.h> /* for size_t */

typedef double double_t;

void distance_squared(
		const double_t * const vector1,
		const double_t * const vector2,
		const size_t vector_size,
		double_t * result
		);

#endif /* #ifndef DISTANCE_SQUARED_H_ */
