from span import Span
from doc import Doc
from span_group import SpanGroup


doc = Doc("Hello, world!")
doc.spans['SpanGroup1'] = SpanGroup(doc, name = 'SpanGroup_1', spans = [Span(doc, start = 0, end = 10), Span(doc, start = 10, end = 20)])
print("*** Call del doc ***")
del doc
print("**************************")

doc = Doc("Hello, world!")

span_1 = Span(doc, start = 10, end = 20)
span_2 = Span(doc, start = 0, end = 10)

print("*** Create GpanGroup ***")
span_group = SpanGroup(doc, name = 'SpanGroup_1', spans = [span_1, span_2])

doc.spans['SpanGroup1'] = span_group

print("*** Get span from SpanGroup ***")
span_3 = doc.spans['SpanGroup1'][0]
span_3.start = span_3.start + 1

print("*** Updated span:", span_3)
print("*** Updated span in SpanGroup:", doc.spans['SpanGroup1'][0])
print("*** Call del doc ***")
del doc
print("*** Exit ***")