#ifndef TEST_H_
#define TEST_H_

static const char * const all_datasets[] = {
    "../data/testoutrank.dat",
    "../data/ball1.dat",
    "../data/testCD.dat",
    "../data/runningex1k.dat",
    "../data/testCDST2.dat",
    "../data/testCDST3.dat",
    "../data/testCDST.dat",
    "../data/runningex10k.dat",
    "../data/runningex20k.dat",
    "../data/segmentation.dat",
    "../data/runningex30k.dat"
    
#if 0
    "../data/pendigits.dat",
    "../data/runningex40k.dat",
    "../data/spam_train.dat",
    "../data/runningex50k.dat",
    "../data/spam.dat",
    "../data/letter-recognition.dat",
    "../data/mesh_network.dat",
    "../data/magicgamma.dat",
    "../data/musk.dat",
    "../data/connect4.dat"
#endif /* #if 0 */
};

int test_all(void);

int test(const char * const data_file);

#endif /* #ifndef TEST_H_ */
