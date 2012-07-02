main: test.hs System/Posix/SchedYield.hs
	ghc --make test.hs

clean:
	rm -f *.o *.hi test
