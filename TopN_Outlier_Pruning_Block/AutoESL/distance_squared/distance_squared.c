#include "distance_squared.h"

void distance_squared(const double * const vector1,
		              const double * const vector2,
		              const size_t vector_size,
		              double * result) {
	*result = 0;

	unsigned int i;
	for (i = 0; i < vector_size; i++) {
		const double val         = vector1[i] - vector2[i];
		const double val_squared = val * val;
		*result                  = *result + val_squared;
	}
}

int top_n_outlier_pruning_block(void * dummy) {
	return 0;
}
