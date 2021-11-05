# distutils: language=c++
from libc.stdint cimport uint64_t

cdef extern from "span_c.hpp" :
    cdef cppclass SpanC :
        #SpanC()
        SpanC(uint64_t id, uint64_t start, uint64_t end, uint64_t start_char, uint64_t end_char, uint64_t label, uint64_t kb_id)
        uint64_t id, start, end, start_char, end_char, label, kb_id
