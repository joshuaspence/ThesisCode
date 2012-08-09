#include <stdio.h>
#include "distance_squared.h"

#define DIMENSIONALITY (4)

int main() {
	double_t vectors[][DIMENSIONALITY] = {
			{0, 0, 0, 0},
			{1, 1, 1, 1}
	};

	double_t result;
	distance_squared(vectors[0], vectors[1], DIMENSIONALITY, &result);

	printf("Output = %f\n", result);

	return 0;
}
