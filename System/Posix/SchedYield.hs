{-# LANGUAGE ForeignFunctionInterface, CPP #-}
module System.Posix.SchedYield(sched_yield)

where

import Foreign.C.Types(CInt(..))
import Foreign.C.Error(throwErrnoIf_)

-- | c_sched_yield is internal FFI entry, without any wrapping of errno value as exception.
#ifdef mingw32_HOST_OS
foreign import ccall "Windows.h SwitchToThread"
    c_sched_yield :: IO CInt
#else
foreign import ccall "sched.h sched_yield"
    c_sched_yield :: IO CInt
#endif

-- | sched_yield yields processor and waits until all other processes, with a comparable or better nice value, could execute at least one time slice.
sched_yield :: IO ()
sched_yield = throwErrnoIf_ (\a -> a < 0) "sched_yield" c_sched_yield

