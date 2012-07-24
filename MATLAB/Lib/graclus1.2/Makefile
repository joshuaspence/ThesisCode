.PHONY: default
default:
	(cd metisLib ; make )
	(cd multilevelLib ; make )
	(cd programs ; make )

.PHONY: all
all: default 

.PHONY: clean
clean:
	(cd metisLib ; make clean )
	(cd multilevelLib ; make clean )
	(cd programs ; make clean )


.PHONY: realclean
realclean:
	(cd metisLib ; make realclean )
	(cd multilevelLib ; make realclean )
	(cd programs ; make realclean )
	(rm *.a)

.PHONY: distclean
distclean: realclean
