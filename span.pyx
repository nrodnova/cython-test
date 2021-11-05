from libcpp.memory cimport shared_ptr
from span_c cimport SpanC
from doc cimport Doc


cdef class Span :

    def __cinit__(self, Doc doc, int start, int end, label=0, vector=None, vector_norm=None, kb_id=0):
        self.doc = doc
#        self.vector = vector
#        self.vector_norm = vector_norm
        print("Creating Span<%d, %d>" % (start, end))

        self.c_ptr = shared_ptr[SpanC](new SpanC(id = 0, start = start, end = end, start_char = 0, end_char = 0, label = label, kb_id = kb_id))
        self.c = self.c_ptr.get()
        #self.c_ptr = shared_ptr[SpanC](new SpanC())

    property start :
        def __get__(self) :
            return self.c_ptr.get().start

        def __set__(self, value) :
            self.c_ptr.get().start = value

    property end:
        def __get__(self):
            return self.c_ptr.get().end

        def __set__(self, value):
            self.c_ptr.get().end = value

    property label:
        def __get__(self):
            return self.c_ptr.get().label

        def __set__(self, value):
            self.c_ptr.get().label = value

    property kb_id:
        def __get__(self):
            return self.c_ptr.get().kb_id

        def __set__(self, value):
            self.c_ptr.get().kb_id = value
    # This doesn't compile
    #property c:
    #    cdef SpanC* __get__(self) :
    #        return self.c_ptr.get()

    def __dealloc__(self) :
        print("Deallocating Span <%s, %s>" % (self.start, self.end))

    def __repr__(self) :
        return "Span <%d, %d, %d, %d>" % (self.start, self.end, self.label, self.kb_id)
