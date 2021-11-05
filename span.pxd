from libcpp.memory cimport shared_ptr
from span_c cimport SpanC
from doc cimport Doc

cdef class Span:
    cdef readonly Doc doc
    cdef shared_ptr[SpanC] c_ptr
    cdef SpanC* c ## I dont like it but it should provide backward syntax compatibility of Span class

    @staticmethod
    cdef inline Span cinit(Doc doc, shared_ptr[SpanC] span):
        ## TODO: make sure c_ptr is not created when this is called
        cdef Span self = Span.__new__(
            Span,
            doc,
            start=span.get().start,
            end=span.get().end
        )
        self.c_ptr = span
        self.c = self.c_ptr.get()
        return self