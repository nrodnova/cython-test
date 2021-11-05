from _dict_proxies import SpanGroups
cdef class Doc :
    def __cinit__(self, text) :
        self.text = text
        self.spans = SpanGroups(self)
        print("Creating Doc(%s)" % self.text)

    def __dealloc__(self) :
        print("Deleting Doc(%s)" % self.text)

    def __repr__(self) :
        return "Doc(%s)" % self.text

    pass