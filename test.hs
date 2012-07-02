module Main(main)

where

import System.Posix.SchedYield(sched_yield)

main = do a <- sched_yield
          print a
          b <- sched_yield
          print b
