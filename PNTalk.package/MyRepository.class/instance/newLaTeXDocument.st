menu actions
newLaTeXDocument

  | str |

  str:=UIManager default request: 'New document name' initialAnswer: 'noname'.
  str := self assureComponentName: str.
  str~='' & str notNil ifTrue: [ self addComponents: {str -> LaTeXDocument new} ].
