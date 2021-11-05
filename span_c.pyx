from libc.stdint cimport uint64_t

cdef extern from "span_c.hpp" :
    cdef cppclass SpanC :
        #SpanC()
        SpanC(uint64_t id = 0, uint64_t start = 0, uint64_t end = 0, uint64_t start_char = 0, uint64_t end_char = 0, uint64_t label = 0, uint64_t kb_id = 0)
        uint64_t id, start, end, start_char, end_char, label, kbid
