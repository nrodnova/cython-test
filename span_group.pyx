from libcpp.vector cimport vector
import weakref
from span_c cimport SpanC
from libcpp.memory cimport shared_ptr

from span cimport Span
from libc.stdint cimport uint64_t, uint32_t, int32_t

cdef class SpanGroup:
    #cdef public object _doc_ref
    #cdef public str name
    #cdef public dict attrs
    #cdef vector[shared_ptr[[SpanC]] c

    def __init__(self, doc, *, name="", attrs={}, spans=[]):
        self._doc_ref = weakref.ref(doc)
        self.name = name
        self.attrs = dict(attrs) if attrs is not None else {}
        cdef Span span
        for span in spans:
            self.push_back(span.c_ptr)
        print("Creating SpanGroup<%s, %d>" % (self.name, len(self)))

    cdef void push_back(self, const shared_ptr[SpanC]& span) nogil :
        self.c.push_back(span)

    @property
    def doc(self):
        """RETURNS (Doc): The reference document.
        DOCS: https://spacy.io/api/spangroup#doc
        """
        doc = self._doc_ref()
        if doc is None:
            # referent has been garbage collected
            raise RuntimeError("SpanGroup: doc reference is empty")
        return doc

    def __len__(self):
        """RETURNS (int): The number of spans in the group.
        DOCS: https://spacy.io/api/spangroup#len
        """
        return self.c.size()

    def append(self, Span span):
        """Add a span to the group. The span must refer to the same Doc
        object as the span group.
        span (Span): The span to append.
        DOCS: https://spacy.io/api/spangroup#append
        """
        if span.doc is not self.doc:
            raise ValueError("Cannot add span to group: refers to different Doc.")
        self.push_back(span.c_ptr)

    def extend(self, spans):
        """Add multiple spans to the group. All spans must refer to the same
        Doc object as the span group.
        spans (Iterable[Span]): The spans to add.
        DOCS: https://spacy.io/api/spangroup#extend
        """
        cdef Span span
        for span in spans:
            self.append(span)

    def __getitem__(self, int i):
        """Get a span from the group.
        i (int): The item index.
        RETURNS (Span): The span at the given index.
        DOCS: https://spacy.io/api/spangroup#getitem
        """
        cdef int size = self.c.size()
        if i < -size or i >= size:
            raise IndexError(f"list index {i} out of range")
        if i < 0:
            i += size
        return Span.cinit(self.doc, self.c[i])

    def __dealloc__(self) :
        print("Deallocating SpanGroup<%s, %d>" % (self.name, len(self)))
