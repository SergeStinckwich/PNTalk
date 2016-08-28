menu actions
newPNClass

  | str |

  str:=UIManager default request: 'New PNtalk class name' initialAnswer: 'noname'.
  str := self assureComponentName: str.
  str~='' & str notNil ifTrue: [ self addComponents: {str -> PNCompiledClass new} ].
