/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "checks.h" /* check for invalid preprocessor macro combinations */
#include "arch.h" /* set architecture specific macros */

#include "test.h" /* for test */
#include "utility.h" /* for size_t, uint_t */
/*----------------------------------------------------------------------------*/

/*============================================================================*/
/* All data sets                                                              */
/*============================================================================*/
static const char * const all_datasets[] = {
    "data/testoutrank.dat",
    "data/ball1.dat",
    "data/testCD.dat",
    "data/runningex1k.dat",
    "data/testCDST2.dat",
    "data/testCDST3.dat",
    "data/testCDST.dat",
    "data/runningex10k.dat",
    "data/runningex20k.dat",
    "data/segmentation.dat",
    "data/runningex30k.dat"
    "data/pendigits.dat",
    "data/runningex40k.dat",
    "data/spam_train.dat",
    "data/runningex50k.dat",
    "data/spam.dat",
    "data/letter-recognition.dat",
    "data/mesh_network.dat",
    "data/magicgamma.dat",
    "data/musk.dat",
    "data/connect4.dat"
};
/*----------------------------------------------------------------------------*/

/*
 * Test all data sets.
 *
 * Return:
 *    The number of failed tests.
 */
int test_all(void) {
    const size_t num_datasets = sizeof(all_datasets) / sizeof(all_datasets[0]);
    uint_t failures = 0;
    
    uint_t i;
    for (i = 0; i < num_datasets; i++) {
        const char * const data_file = all_datasets[i];
        failures += test(data_file);
    }
    
    return failures;
}

/*
 * A wrapper to test the algorithm. When the executable is run with no input 
 * arguments, all data sets will be tested. When an argument is passed to the
 * executable, a single data set will be tested.
 *
 * Return:
 *    The number of failed tests.
 */
int main(int argc, char * argv[]) {
    /* If no argument was specified, then test all data sets. */
    if (argc <= 1) {
        return test_all();
    } else {
        const char * const filename = argv[1];
        return test(filename);
    }
}
