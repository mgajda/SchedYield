SchedYield
==========

FFI sched_yield.
System.Posix.SchedYield.sched_yield may be used after initiating a lot of processes,
and waiting for results (if they arrive through pipe, not wait() call.)
