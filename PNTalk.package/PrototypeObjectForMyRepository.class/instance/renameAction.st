as yet unclassified
renameAction
  | str n |
  str:=UIManager default request: 'Rename' initialAnswer: self name asString.
  n := self parent assureComponentName: (str asAlphaNum).
  n ifNotNil: [ self parent rename: self name to: n asSymbol ].
