as yet unclassified
defaultAction

  | obj |
  (self getCurrentSelection) ifNotNil:
  [
    obj:=self getCurrentSelection item.
    (obj class canUnderstand: #open)
    ifFalse: [obj explore]
    ifTrue: [obj open].
  ].