/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "test.h" /* for test */
/*----------------------------------------------------------------------------*/

/*
 * TODO
 */
int main(int argc, char * argv[]) {
    /* If no argument was specified, then test all data sets. */
    if (argc < 1) {
        return test_all();
    } else {
        const char * const filename = argv[1];
        return test(filename);
    }
}
