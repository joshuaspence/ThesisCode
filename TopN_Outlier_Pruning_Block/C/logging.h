#ifndef LOGGING_H_
#define LOGGING_H_

#if !defined(DEBUG) && defined(LOGGING)
    #error "LOGGING should only be defined in DEBUG mode."
#endif /* #if !defined(DEBUG) && defined(LOGGING) */

#define LOG_LEVEL_0
#define LOG_LEVEL_1
#define LOG_LEVEL_2
#define LOG_LEVEL_DEFAULT	LOG_LEVEL_0

#ifdef LOGGING
    #include <stdio.h> /* for fprintf */
	#include "utility.h" /* for ASSERT_NOT_NULL */
	
	#define LOG_FILE_DECLARE(_logfile_) \
		static FILE * _logfile_;
	
	#define LOG_FILE_OPEN(_logfile_, _path_) \
		do { \
			_logfile_ = fopen(_path_, "a+"); \
		    ASSERT_NOT_NULL(_logfile_); \
	    } while (0)
    
    #define LOG_FILE_WRITE(_logfile_, ...) \
    	do { \
	    	if (_logfile_ != NULL) \
	    		fprintf(_logfile_, __VA_ARGS__); \
    	} while (0)
    
	#define LOG_FILE_CLOSE(_logfile_) \
		fclose(_logfile_);
#else
	#define LOG_FILE_DECLARE(_logfile_)
	#define LOG_FILE_OPEN(_logfile_, _path_)	EMPTY_STATEMENT()
	#define LOG_FILE_WRITE(_logfile, ...)		EMPTY_STATEMENT()
	#define LOG_FILE_CLOSE(_logfile_)			EMPTY_STATEMENT()
#endif /* #ifdef LOGGING */

#endif /* #ifndef LOGGING_H_ */
