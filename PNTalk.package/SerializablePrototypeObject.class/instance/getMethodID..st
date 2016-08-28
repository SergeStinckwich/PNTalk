as yet unclassified
getMethodID: aString

  | id tokens count |

  id:=''.
  count:=1.
  tokens:=(aString asString withSeparatorsCompacted) findTokens: #($ ).
  tokens do:
  [ :str |
	(count odd) ifTrue: [id:=id,str].
	(id at: (id size))=$: ifFalse:
	[
	  count=1 ifTrue: [^id] ifFalse: [^id copyFrom: 1 to: ((id size)-(str size))]
	].
     count:=count+1
  ].
  ^id.