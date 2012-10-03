#ifndef VARDUMP_H_
#define VARDUMP_H_

/*============================================================================*/
/* Includes                                                                   */
/*============================================================================*/
#include "utility.h" /* for __BEGIN_DECLS, __END_DECLS, double_t, index_t, size_t */
/*----------------------------------------------------------------------------*/

__BEGIN_DECLS

int save_vardump(
    const char * const filename,
    const size_t * const num_vectors,
    const size_t * const vector_dims,
    const double_t (* const data)[*num_vectors][*vector_dims],
    const size_t * const k,
    const size_t * const N,
    const size_t * const block_size,
    index_t (* const outliers)[*N],
    double_t (* const outlier_scores)[*N]
    );
    
int read_vardump(
    const char * const filename,
    size_t * const num_vectors,
    size_t * const vector_dims,
    double_t ** const data,
    size_t * const k,
    size_t * const N,
    size_t * const block_size,
    index_t ** const outliers,
    double_t ** const outlier_scores
    );

__END_DECLS

#endif /* #ifndef VARDUMP_H_ */
